class ContentfulDataImportService
  attr_reader :client_entries, :entry, :response

  def initialize
    @response  = { success: 0, errors: {} }
  end

  def call
    fetch_client_entries
    return response if up_to_date?
    import_client_entries
  end

  private

  def fetch_client_entries
    @client_entries = CONTENTFULCLIENT.entries(content_type: 'recipe')
  end

  def up_to_date?
    client_entries.total == Recipe.count
  end

  def import_client_entries
    client_entries.each do |entry|
      @entry = entry
      recipe = Recipe.where(reference_number: entry.id).first_or_initialize
      recipe.assign_attributes(recipe_params)
      recipe.save ? response[:success] += 1 : (response[:errors][entry.id] = recipe.errors.messages)
    end
    response
  end

  def recipe_params
    {
      title: fields[:title],
      image_url: fields[:photo].url,
      description: fields[:description],
      reference_number: entry.id,
      recipe_tags_attributes: tags_attributes,
      recipe_chef_attributes: chef_attributes
    }
  end

  def tags_attributes
    return [] if fields[:tags].blank?
    fields[:tags].collect do |entry_tag|
      tag = Tag.find_or_create_by(name: entry_tag.fields[:name], reference_number: entry_tag.id)
      { tag: tag }
    end
  end

  def chef_attributes
    return {} if fields[:chef].blank?
    chef = Chef.find_or_create_by(name: fields[:chef].fields[:name], reference_number: fields[:chef].id)
    { chef: chef }
  end

  def fields
    entry.fields
  end
end

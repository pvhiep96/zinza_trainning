module ApplicationHelper
  def link_to_add_fields(name, fff, association)
    new_object = fff.object.send(association).klass.new
    id = new_object.object_id
    fields = fff.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + '_fields', f: builder)
    end
    link_to(name, '#', class: 'add_fields', data: { id: id, fields: fields.delete("\n") })
  end
end

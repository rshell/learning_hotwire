class UserFilter < Avo::Filters::BooleanFilter
  self.name = "User filter"

  def apply(request, query, values)
    return query.where(admin: true) if values[:is_admin]
    query
  end

  def default
    {
      is_admin: false
    }
  end

  def options
    {
      is_admin: "Is Admin"
    }
  end
end

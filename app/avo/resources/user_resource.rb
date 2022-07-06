class UserResource < Avo::BaseResource
  self.title = :email
  # self.includes = []

  self.search_query = ->(params:) do
    scope.ransack(id_eq: params[:q], email_cont: params[:q], m: "or").result(distinct: false)
    # scope.ransack(params[:q]).result(distinct: false)
  end
  self.search_query_help = "- search by full id or partial email"

  field :id, as: :text
  field :email, as: :text
  field :admin, as: :boolean
  # add fields here
  filter UserFilter
end

RailsAdmin.config do |config|
  config.model Blog do
    edit do
      # For RailsAdmin >= 0.5.0
      field :description, :ck_editor
      field :name
      field :image
      # For RailsAdmin < 0.5.0
      # field :description do
      #   ckeditor true
      # end
    end
    list do
      field :description do
      pretty_value do
        value.html_safe
      end
    end
      field :name
      field :image
    end
    
  end
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end

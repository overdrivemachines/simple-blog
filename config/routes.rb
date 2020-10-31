# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                    new_author_session GET    /authors/sign_in(.:format)                                                               devise/sessions#new
#                        author_session POST   /authors/sign_in(.:format)                                                               devise/sessions#create
#                destroy_author_session DELETE /authors/sign_out(.:format)                                                              devise/sessions#destroy
#                   new_author_password GET    /authors/password/new(.:format)                                                          devise/passwords#new
#                  edit_author_password GET    /authors/password/edit(.:format)                                                         devise/passwords#edit
#                       author_password PATCH  /authors/password(.:format)                                                              devise/passwords#update
#                                       PUT    /authors/password(.:format)                                                              devise/passwords#update
#                                       POST   /authors/password(.:format)                                                              devise/passwords#create
#            cancel_author_registration GET    /authors/cancel(.:format)                                                                devise/registrations#cancel
#               new_author_registration GET    /authors/sign_up(.:format)                                                               devise/registrations#new
#              edit_author_registration GET    /authors/edit(.:format)                                                                  devise/registrations#edit
#                   author_registration PATCH  /authors(.:format)                                                                       devise/registrations#update
#                                       PUT    /authors(.:format)                                                                       devise/registrations#update
#                                       DELETE /authors(.:format)                                                                       devise/registrations#destroy
#                                       POST   /authors(.:format)                                                                       devise/registrations#create
#                            home_index GET    /home/index(.:format)                                                                    home#index
#                                  root GET    /                                                                                        home#index
#                         post_elements GET    /posts/:post_id/elements(.:format)                                                       authors/elements#index
#                                       POST   /posts/:post_id/elements(.:format)                                                       authors/elements#create
#                      new_post_element GET    /posts/:post_id/elements/new(.:format)                                                   authors/elements#new
#                     edit_post_element GET    /posts/:post_id/elements/:id/edit(.:format)                                              authors/elements#edit
#                          post_element GET    /posts/:post_id/elements/:id(.:format)                                                   authors/elements#show
#                                       PATCH  /posts/:post_id/elements/:id(.:format)                                                   authors/elements#update
#                                       PUT    /posts/:post_id/elements/:id(.:format)                                                   authors/elements#update
#                                       DELETE /posts/:post_id/elements/:id(.:format)                                                   authors/elements#destroy
#                                 posts GET    /posts(.:format)                                                                         authors/posts#index
#                                       POST   /posts(.:format)                                                                         authors/posts#create
#                              new_post GET    /posts/new(.:format)                                                                     authors/posts#new
#                             edit_post GET    /posts/:id/edit(.:format)                                                                authors/posts#edit
#                                  post GET    /posts/:id(.:format)                                                                     authors/posts#show
#                                       PATCH  /posts/:id(.:format)                                                                     authors/posts#update
#                                       PUT    /posts/:id(.:format)                                                                     authors/posts#update
#                                       DELETE /posts/:id(.:format)                                                                     authors/posts#destroy
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#   rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  devise_for :authors
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  scope module: 'authors' do
  	resources :posts do
  	  resources :elements
  	end
  end
end

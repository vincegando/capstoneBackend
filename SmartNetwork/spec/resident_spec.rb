require "rails_helper"

RSpec.describe ResidencesController, :type => :controller do
  describe "Residence information" do
    it "return corretly a json cointatning the corret information" do
      get :search
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    # it "renders the index template" do
    #   get :index
    #   expect(response).to render_template("index")
    # end

    # it "loads all of the posts into @posts" do
    #   post1, post2 = Post.create!, Post.create!
    #   get :index
    #
    #   expect(assigns(:posts)).to match_array([post1, post2])
    # end
  end
end



RSpec.describe "home page", :type => :request do
  json_input = File.read(Rails.root.join('spec/sample_data/save_heatmap_example.json'))
  it "displays the user's username after successful login" do
    params ={}
    post "/process_residence_information", json_input,  {'ACCEPT' => "application/json", 'CONTENT_TYPE' => 'application/json'}
    expect(response).to be_success
    expect(response).to have_http_status(200)
  end
end
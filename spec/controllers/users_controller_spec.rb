require 'rails_helper'
require 'spec_helper'

describe UsersController do
  describe "GET show" do
    it_behaves_like "require sign in" do
      let(:action) {get :show, id: 3}
    end

    it "sets @user" do
      set_current_user
      alice = Fabricate(:user)
      get :show, id: alice.id
      expect(assigns(:user)).to eq(alice)
    end
  end

  describe "GET new" do
    it "sets @user" do
      get :new
      expect(assigns(:user)).to be_new_record
      expect(assigns(:user)).to be_instance_of(User)
    end
  end

  describe "POST create" do
    context "with valid input" do
      before do
        post :create, user: Fabricate.attributes_for(:user)
      end

      it "sets @user" do
        expect(assigns(:user)).to be_instance_of(User)
      end

      it "creates the user" do
        expect(User.count).to eq(1)
      end

      it "redirects to the root path" do
        expect(response).to redirect_to root_path
      end

      it "displays welcome message" do
        expect(flash[:success]).to eq("You are registered.")
      end
    end

    context "with invalid input" do
      before do
        post :create, user: {password: "password", username: "Alice"}
      end

      it "sets @user" do
        expect(assigns(:user)).to be_instance_of(User)
      end

      it "does not create the user" do
        expect(User.count).to eq(0)
      end

      it "renders the :new template" do
        expect(response).to render_template :new
      end

      it "displays error message" do
        expect(flash[:danger]).to eq("Invalid user information. Please check the errors below.")
      end
    end

    context "sending emails" do
      before {ActionMailer::Base.deliveries.clear}

      it "sends out an email to a user with valid inputs" do
        post :create, user: {email: "joe@example.com", password: "password", username: "Joe Smith"}
        expect(ActionMailer::Base.deliveries.last.to).to eq(['joe@example.com'])
      end

      it "sends out email containing the user's name with valid inputs" do
        post :create, user: {email: "joe@example.com", password: "password", username: "Joe Smith"}
        expect(ActionMailer::Base.deliveries.last.body).to include("Joe Smith")
      end

      it "does not send out email with invalid inputs" do
        post :create, user: {email: "joe@example.com"}
        expect(ActionMailer::Base.deliveries).to be_empty
      end
    end
  end
end

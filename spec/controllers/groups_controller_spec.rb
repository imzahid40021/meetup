require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new group" do
        expect do
          post :create, params: { group: { name: "New Group" } }
        end.to change(Group, :count).by(1)
      end

      it "redirects to the created group" do
        post :create, params: { group: { name: "New Group" } }
        expect(response).to redirect_to(Group.last)
      end
    end

    context "with invalid parameters" do
      it "does not create a new group" do
        expect do
          post :create, params: { group: { name: nil } }
        end.not_to change(Group, :count)
      end

      it "redirects to the new group form" do
        post :create, params: { group: { name: nil } }
        expect(response).to redirect_to(new_group_path)
      end
    end
  end

  describe "GET #edit" do
    let(:group) { Group.create(name: "Sample Group") }

    it "returns a success response" do
      get :edit, params: { id: group.to_param }
      expect(response).to be_successful
    end
  end

  describe "PUT #update" do
    let(:group) { Group.create(name: "Sample Group") }

    context "with valid parameters" do
      let(:new_attributes) { { name: "Updated Group Name" } }

      it "updates the requested group" do
        put :update, params: { id: group.to_param, group: new_attributes }
        group.reload
        expect(group.name).to eq("Updated Group Name")
      end

      it "redirects to the group" do
        put :update, params: { id: group.to_param, group: new_attributes }
        expect(response).to redirect_to(group)
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { name: nil } }

      it "does not update the group" do
        put :update, params: { id: group.to_param, group: invalid_attributes }
        group.reload
        expect(group.name).to eq("Sample Group")
      end

      it "re-renders the 'edit' template" do
        put :update, params: { id: group.to_param, group: invalid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:group) { Group.create(name: "Sample Group") }

    it "destroys the requested group" do
      expect do
        delete :destroy, params: { id: group.to_param }
      end.to change(Group, :count).by(-1)
    end

    it "redirects to the groups list" do
      delete :destroy, params: { id: group.to_param }
      expect(response).to redirect_to(groups_url)
    end
  end
end

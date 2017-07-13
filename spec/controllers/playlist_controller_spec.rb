RSpec.describe PlaylistsController, type: :controller do
  describe "POST #create" do
    context "with valid params" do
      it "creates a new playlist" do
        expect {
          post :create, params: {playlist: attributes_for(:playlist)}
        }.to change(Playlist, :count).by(1)
      end
      it "assigns a newly created playlist to @playlist" do
        post :create, params: {playlist: attributes_for(:playlist)}
        expect(assigns(:playlist)).to be_a(Playlist)
      end

      it "redirects to individual show page" do
        post :create, params: {playlist: attributes_for(:playlist)}
        expect(response).to redirect_to(Playlist.last)
      end
    end
    context "with invalid params" do
      before :each do
        post :create, params: {playlist: attributes_for(:playlist, name: nil)}
      end
      it "assigns a newly created but unsaved playlist as @playlist" do
        expect(assigns(:playlist)).to be_a(Playlist)
      end
      it "re-renders the 'new' template" do
        expect(response).to render_template('new')
      end
    end
  end
  describe "PUT #update" do
    context "with valid params" do
      before :each do
        @playlist = create(:playlist)
        put :update, params: {id: @playlist.to_param, playlist: attributes_for(:playlist, name: "new_name")}
        @playlist.reload
      end
      it "edits the playlist" do
        expect(@playlist.name).to eq("new_name")
      end
      it "assigns the playlist as @playlist" do
        expect(assigns(:playlist)).to eq(@playlist)
      end
      it "redirects to the created artist" do
        expect(response).to redirect_to(@playlist)
      end
    end
    context "with invalid params" do
      before :each do
        @playlist = create(:playlist)
        put :update, params: {id: @playlist.to_param, playlist: attributes_for(:playlist, name: nil)}
        @playlist.reload
      end
      it "assigns a newly created but unsaved playlist as @playlist" do
        expect(assigns(:playlist)).to eq(@playlist)
      end
      it "redirects to the edit page" do
        expect(response).to render_template("edit")
      end
    end
  end
end

RSpec.describe BooksController, type: :controller do
  describe '#index' do
    context 'when user is admin' do
      login_admin
      it 'response successfully with an HTTP 200 status code' do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
      end
    end

    context 'when user is normal user' do
      login_user
      it 'response unauthorized with an HTTP 302 status code' do
        get :index
        expect(response).to have_http_status(302)
        expect(flash[:alert]).to eq('You are not authorized to perform this action.')
      end
    end
  end

  describe '#published_index' do

    context 'when user is admin user' do
      login_admin
      it 'response successfully with an HTTP 200 status code' do
        get :published_index
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
      end
    end

    context 'when user is normal user' do
      login_user
      it 'response successfully with and HTTP 200 status code' do
        get :published_index
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
      end
    end
  end

  describe '#uploaded_index' do
    context 'when user is admin user' do
      login_admin
      it 'response successfully with an HTTP 200 status code' do
        get :uploaded_index
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
      end
    end

    context 'when user is normal user' do
      login_user
      it 'response successfully with an HTTP 200 status code' do
        get :uploaded_index
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
      end
    end
  end

  describe '#subscribed_index' do
    context 'when user is admin user' do
      login_admin
      it 'response successfully with an HTTP 200 status code' do
        get :subscribed_index
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
      end
    end
  end

  describe '#show' do
    context 'when user is admin user' do
      login_admin
      xit 'response successfully with an HTTP 200 status code' do
        get :show
        puts "STAtus#################"
        puts responnse.status
        expect(response).to be_success
        expect(response).to have_http_status(200)
        #expect(response).to render_template :show
      end
    end
  end
end


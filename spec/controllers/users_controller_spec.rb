require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST create' do
    context 'when the user is an admin' do
      let(:params) do
        {
          user: {
            name: 'Vitor',
            admin: true
          }
        }
      end

      before do
        post :create, params: params
      end

      it 'create an admin' do
        # subject

        expect(User.find_by(name: 'Vitor').admin_flag).to eq(true)
        expect(Event.where(event_name: Application::User::Events::CreateAdmin::NAME).count).to eq(1)
        expect(Event.where(event_name: Application::User::Events::CreateUser::NAME)).to be_empty
      end
    end

    context 'when the user is not an admin' do
      let(:params) do
        {
          user: {
            name: 'João',
            admin: false
          }
        }
      end

      before do
        post :create, params: params
      end

      it 'create an user' do
        expect(User.find_by(name: 'João').admin_flag).to eq(false)
        expect(Event.where(event_name: Application::User::Events::CreateUser::NAME).count).to eq(1)
        expect(Event.where(event_name: Application::User::Events::CreateAdmin::NAME)).to be_empty
      end
    end

    context 'when the parameters are wrong' do
      let(:params) do
        {
          user: {
            name: nil,
            admin: false
          }
        }
      end

      before do
        post :create, params: params
      end

      it 'raise an exception' do
        expect(Event.where(event_name: Application::User::Events::CreateUserException::NAME).count).to eq(1)
      end
    end
  end
end

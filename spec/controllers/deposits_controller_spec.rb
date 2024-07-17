require 'rails_helper'

RSpec.describe DepositsController, type: :controller do
  let!(:tradeline) { create(:tradeline) }
  let!(:deposit) { create(:deposit, tradeline: tradeline) }

  describe 'GET #index' do
    it 'returns a success response and all deposits for a tradeline' do
      get :index, params: { tradeline_id: tradeline.id }
      expect(response).to be_successful
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe 'GET #show' do
    it 'returns a success response and deposit for a given id' do
      get :show, params: { tradeline_id: tradeline.id, id: deposit.id }
      expect(response).to be_successful
      expect(JSON.parse(response.body)['id']).to eq(deposit.id)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) { { date: Date.today + 3.days, amount: 100.0 } }

      it 'creates a new deposit' do
        expect do
          post :create, params: { tradeline_id: tradeline.id, deposit: valid_params }
        end.to change(Deposit, :count).by(1)
      end

      it 'returns the created deposit' do
        post :create, params: { tradeline_id: tradeline.id, deposit: valid_params }
        expect(JSON.parse(response.body)['amount'].to_f).to eq(100.0)
      end
    end

    context 'with invalid params' do
      let(:invalid_params) { { date: Date.today, amount: -10.0 } }

      it 'returns validation error indicating amount must be greater than 0' do
        post :create, params: { tradeline_id: tradeline.id, deposit: invalid_params }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to eq("amount" => ["must be greater than 0"])
      end

      it 'does not create a deposit that exceeds the outstanding balance of a tradeline' do
        invalid_amount = { date: Date.today + 2.days, amount: tradeline.amount + 1 }
        post :create, params: { tradeline_id: tradeline.id, deposit: invalid_amount }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to eq("amount" => ["deposit amount cannot exceed outstanding balance of a tradeline"])
      end
    end
  end
end

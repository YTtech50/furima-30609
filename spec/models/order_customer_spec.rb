require 'rails_helper'

RSpec.describe OrderCustomer, type: :model do
  before do
    @order_customer = FactoryBot.build(:order_customer)
  end

  describe '商品の購入' do
    context '商品の購入がうまくいくとき' do
      it '全ての必須項目の入力が存在すれば購入できること' do
        expect(@order_customer).to be_valid
      end

      it '正しいクレジットカードの情報があれば購入できること' do
        @order_customer.token = 'tok_abcdefghijk00000000000000000'
        expect(@order_customer).to be_valid
      end

      it '住所情報の建物の入力が無くても購入できること' do
        @order_customer.building = ''
        expect(@order_customer).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it '正しいクレジットカード情報の入力が無いと購入できないこと' do
        @order_customer.token = ''
        @order_customer.valid?
        expect(@order_customer.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号の入力が無いと購入できないこと' do
        @order_customer.postal_code = ''
        @order_customer.valid?
        expect(@order_customer.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンが無ければ購入できないこと' do
        @order_customer.postal_code = '1234567'
        @order_customer.valid?
        expect(@order_customer.errors.full_messages).to include('Postal code Input correctly')
      end

      it '都道府県の情報が無いと購入できないこと' do
        @order_customer.prefecture_id = '0'
        @order_customer.valid?
        expect(@order_customer.errors.full_messages).to include('Prefecture Select')
      end

      it '市区町村の入力が無ければ購入できないこと' do
        @order_customer.city = ''
        @order_customer.valid?
        expect(@order_customer.errors.full_messages).to include("City can't be blank")
      end

      it '番地の入力が無ければ購入できないこと' do
        @order_customer.addresses = ''
        @order_customer.valid?
        expect(@order_customer.errors.full_messages).to include("Addresses can't be blank")
      end

      it '電話番号の入力が無ければ購入できないこと' do
        @order_customer.phone_number = ''
        @order_customer.valid?
        expect(@order_customer.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号の入力は11桁以内でなければ購入できないこと' do
        @order_customer.phone_number = '090123456789'
        @order_customer.valid?
        expect(@order_customer.errors.full_messages).to include('Phone number Input only number')
      end

      it '電話番号の入力にハイフンが入っていると購入できないこと' do
        @order_customer.phone_number = '090-1235678'
        @order_customer.valid?
        expect(@order_customer.errors.full_messages).to include('Phone number Input only number')
      end
    end
  end
end

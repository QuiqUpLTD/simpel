require 'spec_helper'

describe Simpel do

  it 'serializes attributes' do
    Simpel.define do
      root :book do
        attributes :title, :year
      end
    end

    expect(Simpel.registry[:book].to_json).to eq({only: [:title, :year]})
  end

  it 'serializes methods' do
    Simpel.define do
      root :book do
        methods :title, :year
      end
    end

    expect(Simpel.registry[:book].to_json).to eq({methods: [:title, :year]})
  end

  describe '#has_one' do
    it 'serializes attributes' do
      Simpel.define do
        root :book do
          has_one :author do
            attributes :first_name, :last_name
          end
        end
      end

      expect(Simpel.registry[:book].to_json).to eq({include: {author: {only: [:first_name, :last_name]}}})
    end

    it 'serializes methods' do
      Simpel.define do
        root :book do
          has_one :author do
            methods :write_book, :publish_book
          end
        end
      end

      expect(Simpel.registry[:book].to_json).to eq({include: {author: {methods: [:write_book, :publish_book]}}})
    end
  end

  describe '#has_many' do
    it 'serializes attributes' do
      Simpel.define do
        root :book do
          has_many :pages do
            attributes :number, :body
          end
        end
      end

      expect(Simpel.registry[:book].to_json).to eq({include: {pages: {only: [:number, :body]}}})
    end

    it 'serializes methods' do
      Simpel.define do
        root :book do
          has_many :pages do
            methods :number, :body
          end
        end
      end

      expect(Simpel.registry[:book].to_json).to eq({include: {pages: {methods: [:number, :body]}}})
    end
  end

  describe '#serialize' do
    it 'generates json' do
    end
  end

  context 'Class Methods' do

    describe '.clear_registry' do

      it 'clears the registry' do
        Simpel.define do
          root :book do
            has_many :pages do
              methods :number, :body
            end
          end
        end

        Simpel.clear_registry

        expect(Simpel.registry).to eq({})
      end
    end
  end
end

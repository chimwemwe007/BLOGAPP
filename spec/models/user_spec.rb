require 'rails_helper'

RSpec.describe User, type: :model do
<<<<<<< HEAD
  subject do
    User.new(
      name: 'Doe', photo: 'https://johndoe.com/me.png',
      bio: 'I am John Doe.', posts_counter: 0
    )
  end

  before { subject.save } # save the user before each test

  context 'Return valid data' do
    it 'should accept name' do
      subject.name = 'Doe'
      expect(subject).to be_valid
    end

    it 'should accept post_counter' do
      subject.posts_counter = 3
      expect(subject).to be_valid
    end
  end

  context 'Return invalid data' do
    it 'should not accept blank name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should not accept negative post_counter' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end

    it 'should not accept non numerical post_counter' do
      subject.posts_counter = 'count'
      expect(subject).to_not be_valid
    end
=======
  subject { User.new(name: 'Edi', photo: 'https://avatars.githubusercontent.com/u/105216647?v=4', posts_counter: 10, bio: 'Full-stack developer') }

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Post Counter must be integer' do
    subject.posts_counter = 'z'
    expect(subject).to_not be_valid
  end

  it 'Post Counter must be 0 or greater' do
    subject.posts_counter = -5
    expect(subject).to_not be_valid
>>>>>>> a84e878566ac4c3820d02ce9889d3f621b67f9fa
  end
end

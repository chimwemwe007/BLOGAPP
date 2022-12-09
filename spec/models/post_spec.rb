require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:author) { User.create(name: 'test', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'test', posts_counter: 2) }

  subject do
    Post.new(title: 'test', author_id: author.id, comments_counter: 2, likes_counter: 2)
  end
  before(:all) do
    @user = User.create(
      name: 'Doe', photo: 'https://johndoe.com/me.png',
      bio: 'I am John Doe.', posts_counter: 0
    )
  end

  subject do
    Post.new(
      author: @user, title: 'About', text: 'About me', comments_counter: 1,
      likes_counter: 0
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
    context 'Return valid data' do
      it 'should accept comments_counter' do
        subject.comments_counter = 2
        expect(subject).to be_valid
      end

      it 'should accept title' do
        subject.title = 'About'
        expect(subject).to be_valid
      end

      it 'should accept likes_counter' do
        subject.likes_counter = 6
        expect(subject).to be_valid
      end
    end

    it 'is not valid without a author_id' do
      subject.author_id = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a comments_counter' do
      subject.comments_counter = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a likes_counter' do
      subject.likes_counter = nil
      expect(subject).to_not be_valid
    end
    context 'Return invalid data' do
      it 'should not accept more than 250 character' do
        subject.title = '
        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula
        eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient
        montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque
        eu, pretium quis,'
        expect(subject).to_not be_valid
      end

      it 'should not accept blank title' do
        subject.title = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid with a title longer than 250 characters' do
        subject.title = 'a' * 251
        expect(subject).to_not be_valid
      end
      it 'should accept negative comments_counter' do
        subject.comments_counter = -2
        expect(subject).to_not be_valid
      end

      it 'is not valid with a comments_counter not being an integer' do
        subject.comments_counter = 'a'
        expect(subject).to_not be_valid
      end
      it 'should accept negative likes_counter' do
        subject.likes_counter = -6
        expect(subject).to_not be_valid
      end

      it 'is not valid with a comments_counter being less than 0' do
        subject.comments_counter = -1
        expect(subject).to_not be_valid
      end
      it 'should accept non numerical comments_counter' do
        subject.comments_counter = 'C'
        expect(subject).to_not be_valid
      end

      it 'is not valid with a likes_counter not being an integer' do
        subject.likes_counter = 'a'
        expect(subject).to_not be_valid
      end

      # add tests for your custom methods here
      it 'should return the most recent comments' do
        post = Post.create(title: 'test', author_id: author.id, comments_counter: 2, likes_counter: 2)
        comment2 = Comment.create(text: 'test', author_id: author.id, post_id: post.id)
        comment3 = Comment.create(text: 'test', author_id: author.id, post_id: post.id)
        comment4 = Comment.create(text: 'test', author_id: author.id, post_id: post.id)
        comment5 = Comment.create(text: 'test', author_id: author.id, post_id: post.id)
        comment6 = Comment.create(text: 'test', author_id: author.id, post_id: post.id)
        expect(post.most_recent_comments).to eq([comment6, comment5, comment4, comment3, comment2])
      end
    end
    it 'should accept non numerical likes_counter' do
      subject.likes_counter = 'C'
      expect(subject).to_not be_valid
    end
  end
end

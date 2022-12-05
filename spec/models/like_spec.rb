require 'rails_helper'

<<<<<<< HEAD
RSpec.describe Like, type: :model do
  @user = User.create(
    name: 'Doe', photo: 'https://johndoe.com/me.png',
    bio: 'I am John Doe.', posts_counter: 0
  )

  post = Post.create(
    author: @user, title: 'About', text: 'About me', comments_counter: 0,
    likes_counter: 0
  )

  Like.create(post:, author: @user)

  context 'update_likes_counter' do
    it ' increment likes_counter' do
      expect(Post.find(post.id).likes_counter).eql?(post.likes_counter + 1)
    end
=======
describe Like, type: :model do
  before :each do
    @author = User.new(name: 'Edi', photo: 'https://avatars.githubusercontent.com/u/105216647?v=4',
                       bio: 'Full-stack developer')
    @post = Post.new(author: @author, title: 'Post one', text: 'Post')

    @like = Like.create(author: @author, post: @post)
  end

  it 'can not update likes_counter its a private method' do
    expect(@like).to_not respond_to(:update_likes_counter)
  end

  it 'will have the Posts likes_counter through update_comments_counter ' do
    expect(@post.likes_counter).to eq 1
>>>>>>> a84e878566ac4c3820d02ce9889d3f621b67f9fa
  end
end

require 'rails_helper'

<<<<<<< HEAD
RSpec.describe Comment, type: :model do
  @user = User.create(
    name: 'Doe', photo: 'https://johndoe.com/me.png',
    bio: 'I am John Doe.', posts_counter: 0
  )

  post = Post.create(
    author: @user, title: 'About', text: 'About me', comments_counter: 0,
    likes_counter: 0
  )

  Comment.create(post:, author: @user)

  context 'update_comments_counter' do
    it ' increment comments_counter' do
      expect(Post.find(post.id).comments_counter).eql?(post.comments_counter + 1)
    end
=======
describe Comment, type: :model do
  before :each do
    @author = User.new(name: 'Edi', photo: 'https://avatars.githubusercontent.com/u/105216647?v=4',
                       bio: 'Full-stack developer')
    @post = Post.new(author: @author, title: 'Post one', text: 'Post')

    @comment1 = Comment.create(author: @author, post: @post, text: 'Comment one')
    @comment2 = Comment.create(author: @author, post: @post, text: 'Comment two')
  end

  it 'can not update likes_counter its a private method' do
    expect(@comment1).to_not respond_to(:update_comments_counter)
    expect(@comment2).to_not respond_to(:update_comments_counter)
  end

  it 'will have the Posts comments_counter through update_comments_counter ' do
    expect(@post.comments_counter).to eq 2
>>>>>>> a84e878566ac4c3820d02ce9889d3f621b67f9fa
  end
end

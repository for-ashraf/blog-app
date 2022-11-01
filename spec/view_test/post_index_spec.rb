RSpec.describe 'user_show', type: :feature do
  before(:each) do
    @user = User.create(
        name: 'zubair',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'full-stack developer.',
        posts_counter: 0
    )

    @post1 = Post.new(title: 'firstpost', text: 'post one', comments_counter: 0, likes_counter: 0)
    @post1.user_id = @user.id
    @post1.save

    @comment1 = Comment.new(text: 'first comment')
    @comment1.user_id = @user.id
    @comment1.post_id = @post.id
    @comment1.save

    visit "ADD THE URL HERE"

  end
    it 'see the user profile picture' do
        expect(page.html).to include('User Img')
    end

    it 'user username' do 
        expect(page).to have_content("#{@user.name}") 
    end

    it 'number of posts' do 
        expect(page).to have_content("#{@user.posts_counter}")
    end

    it 'see post title' do 
        expect(page).to have_content("#{@post.title}")  
    end

    it 'see post body' do
        expect(page).to have_content("#{@post.text}")  
    end

    it 'see the comment' do #not sure about this !!!
        expect(page).to have_content("#{@comment.text}")
    end

    it 'see how many comments are there for a post' do 
        expect(page).to have_content("#{@post.comments_counter}")
    end

    it 'see how many likes are there for a post' do 
        expect(page).to have_content("#{@post.likes_counter}")
    end

    it 'clicking user post send to post show page' do
        user = User.first
        post = Post.first
        click_link(post.title)
        expect(page.current_path).to eql("/users/#{user.id}/posts/#{post.id}")
    end  
end
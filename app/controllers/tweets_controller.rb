class TweetsController < ApplicationController
  before_action :authenticate, :except => [:index, :show]

  def index
    tweets = Tweet.all
    render json: tweets, status: 200
  end

  def create
    if tweet_params[:content].length <= 140
      @user.tweets.create(tweet_params)
      render json: @user.tweets.last, status: 200
    else
      render json: {error: "Tweet must be less than 140 characters"}, status: 400
    end
  end

  def show
    tweet = Tweet.find_by(id: params[:id])
    if tweet
      render json: tweet, status: 200
    else
      render json: {error: "Cannot find tweet with the ID"}, status: 404
    end
  end

  def destroy
    tweet = Tweet.find_by(id: params[:id])
    tweet.destroy
    render json: tweet
  end


    protected
      def authenticate
        authenticate_or_request_with_http_token do |token, options|
          @user = User.find_by(auth_token: token)
        end
      end

    private
      def tweet_params
        params.require(:tweet).permit(:content, :auth_token)
      end

end

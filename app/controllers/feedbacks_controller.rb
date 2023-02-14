class FeedbacksController < ApplicationController
    before_action :authenticate_user!

    def create
      tweet = Tweet.find(params[:tweet_id])
      feedback = tweet.feedbacks.build(feedback_params) #buildを使い、contentとtweet_idの二つを同時に代入
      feedback.user_id = current_user.id
      if feedback.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path) #直前のページにリダイレクト
      else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path) #直前のページにリダイレクト
      end
    end
  
    private
  
      def feedback_params
        params.require(:feedback).permit(:content)
      end
end

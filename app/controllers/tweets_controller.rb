class TweetsController < ApplicationController
  
  def index
    @client=Twitterclient.client

    #retuns output from twitter
    @sentence_user_array = @client.user_timeline.collect{|x| x[:text]}
    @sentence_homepage_array = @client.home_timeline.collect{|x| x[:text]}

    #converts array to array of words
    @user_word_array = sentence_to_word(@sentence_user_array)
    @homepage_word_array = sentence_to_word(@sentence_homepage_array)


    #gets rid of unwanted syntax from words
    @modified_user_array=modify_response(@user_word_array)
    @modified_homepage_array=modify_response(@homepage_word_array)


    render params[:homefeed] ? "homefeed" : "index"  
  end


  private

  def sentence_to_word(array)
    string = array.join(" ");
    array_again=string.split;
    array_again.shuffle!;
  end

  def modify_response(array)
      array.map!{|x| x.gsub(/^https?:\/\/(.*)/, " ") }
      array.map!{|x| x.gsub(/\.$/, " ") }
      array.map!{|x| x.gsub(/^\./, " ") }
      array.map!{|x| x.strip}
      array.map!{|x| x.gsub(/^\(/, " ") }
      array.map!{|x| x.gsub(/\)$/, " ")}
      array.map!{|x| x.gsub(/,$/, " ") }
      array.map!{|x| x.gsub(/:$/, " ") }
      array.map!{|x| x.gsub(/^&amp(.*)/, "&") }
      array.map!{|x| x.strip}
      array.reject!{|x| x== " "|| x=="," || x==""}
      array.map!{|x| x.strip}
  end



end

//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Mac on 05/03/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favButon: UIButton!
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
            
        }, failure: { (error) in
            print("Error in reading")
        })
    }
    

    
    
    
    @IBAction func favoriteTweet(_ sender: Any) {
        
        let tobeFavorited = !favorited
        if(tobeFavorited)
        {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
               print("Favorite did not suceed")
                
            })
        }else
        {
            TwitterAPICaller.client?.unFavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                 print("unFavorite did not suceed")
                
            })
        }
    
    }
    
    var favorited:Bool = false
    var tweetId:Int = -1
    
    var retweeted:Bool = false
    
    func setFavorite(_ isFavorited:Bool){
        
        favorited = isFavorited
        if(favorited){
            favButon.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
            
        }
        else{
            favButon.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
            
        }
        
    }
    
    func setRetweeted(_ isRetweeted:Bool)
    {
        
        if(isRetweeted)
        {
            retweetButton.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
            
        }else{
            retweetButton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

# BT_BlockLists
Transmission block list

# Usage
1. You can either copy https://github.com/Naunter/BT_BlockLists/raw/master/bt_blocklists.gz  **OR**  https://github.com/Naunter/BT_BlockLists/releases/download/v.1/bt_blocklists.gz

2. Depending on your version, paste the link to `Transmission > Settings > Peers > Blocklist`   
   **OR**  
   paste the link to `Transmission > Edit > Preferences > Privacy > Enable blocklist`    
3. Click `Update` to update the blocklist.

![Screenshot_2021-10-27_21-08-32](https://user-images.githubusercontent.com/17890335/139168982-26b8ff86-d6e4-493a-bcb1-f1aa40593276.png)

# Update
## 20230201
- Because Node.js 12 actions are deprecated, update `dev-drprasad/delete-tag-and-release@v0.2.0` to `dev-drprasad/delete-tag-and-release@master`.
- Blocklist now create by `update.sh`.

## 20230117
- [#10](https://github.com/Naunter/BT_BlockLists/issues/10). No long use source from iblocklist.com, but you still can find it at [update_iblocklist.sh](https://github.com/Naunter/BT_BlockLists/blob/master/update_iblocklist.sh) and [main.yml.iblocklist](https://github.com/Naunter/BT_BlockLists/blob/master/.github/workflows/main.yml.iblocklist).
- New source is from [mirror.codebucket.de](https://mirror.codebucket.de/transmission/). The author has done a great job and it's all packed. What I did just copy paste, because many people are still using the old download link from my repo. If possible, please support the original author.
- I also created a [new script](https://github.com/Naunter/BT_BlockLists/blob/master/update.sh), it uses some the sources from this issue [#10](https://github.com/Naunter/BT_BlockLists/issues/10).
- Feel free to fork and host your own blocklist.

# Reference
- [Transmission official website](https://transmissionbt.com/)
- [Transmission source code](https://github.com/transmission/transmission)
- [mirror.codebucket.de](https://mirror.codebucket.de/transmission/)
- [Some more sources ... #10](https://github.com/Naunter/BT_BlockLists/issues/10)
- [https://gist.github.com/johntyree/3331662](https://gist.github.com/johntyree/3331662)
- [https://gist.github.com/shmup/29566c5268569069c256](https://gist.github.com/shmup/29566c5268569069c256)
- [GitHub Action for GitHub Push](https://github.com/ad-m/github-push-action)
- [What blocklist does Transmission Use?](https://github.com/transmission/transmission/blob/main/docs/Blocklists.md)
- [iblocklist](https://www.iblocklist.com/lists.php) 
- [Wael Best blocklist](https://www.wael.name/other/best-blocklist/)
- [Wael Best blocklist on Github](https://github.com/waelisa/Best-blocklist)
- [Transmission 3.0 Blocklists](https://forum.transmissionbt.com/viewtopic.php?t=20466)

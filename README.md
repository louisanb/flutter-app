# prepare 
To get access or link the repo online(download repo manuely wont link it to the repo online cuz no auth)
0. go to the fldr/dir u want to clone the repo to(git ll create a new fldr inside of this dir)
1. git clone https://github.com/yclive0925/sevenbuddies-client.git
2. cd sevenbuddies_mobile
3. git checkout develop
 
After you have some change need to commit/push 
4. git add --all 
5. git commit -m "your comment here" 
- it may ask u to do this:(do it then commit)   
  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"
6. git push
 
Create a new branch
1. git branch featrue/new-branch-name
2. create and cd into it at the same time: git checkout -b new-branch-name
 
## note/report
 
2019
0. all abriviations i used: prod=product prods=prodcts abv=above bef=before w=widget bot=bottom af=after  
1. 8/14-8/18 (5d) reviewed the course/note one last time to make sure understanding every line of code learned so far. Thought out the main frame/layout of the app. Checked out api usage on the doc and tried out on postman. Implemented api usage from postman to the app. Merged the difference the code had between the course and what we need(adjusted the code from the course to work with our api; mainly post, get or login/register, token). Setted up the connection between the course and app(or app and api) to a point the code is fully functioning. 
1.1 There s a bug at the top of log in pg the first 2 input field i think there s weird margin on the left that i cant find(i did not have time to look into it too deep cuz it s not a big bug or visible at this point) u can use dev tool to inspect this on a browser 
2. 8/21-8/24 (4d) merged the app/code made by first person with the course code/idea. Further simplified/automized the code/frame; improved the reusable code/blocks. Combined the sign in and sign up page into one essentially. Connected the api err such as login err with the app. So if there s err at login/sign up user ll get feedbacks. 
2.1 Some code/block need to be further simplified or made more flexible or reusable( i ll try to mark them so u know where) but this needs sophisticated thought out on the trade off meaning if u make it too highly automated/framed or framable/reusable then there ll be performance set back that there ll be a lot junk parameters that s not needed for certain features or blocks 
2.2 The dio file need to be utilized if needed
2.3 Someone needs to double check the parameters with zeplin or parameters on file/designed parameters. I may not put them in all right 
3. 8/27-9/1 (6d) Made and almost fully styled home pg, request pg and order list pg with fake data; i forgot if i made the filter this week or next week for diff stages of the order(req, to do, finished...)      
3.1 const/static need to be added so check var types  
3.2 note/comment for myself need to be cleaned also unused import
4. 9/3-9/8 (5d) before i was using fake data now i linked it to the backend. I was linking only the login previously but now it s maybe half way linked(there s some stages i dont have access to due to stripe so i cant test the whole transaction process); bot nav bar;
4.1 There s a bug at text btn i accidently used it at the wrong place and to use it i modified the template/widget to a point that it effected other places badly but not visible so i havent fixed it yet. It s at order list pg the 4 filter boxes i should have used text btn widget now there s a bckgrd color of white in those text container not that visible tho but still... 
5. 9/11-9/15 (5d) setted up git; setted up edit pg's frame; got time eidt to work roughly; bot nav bar bug fix;
5.1 i think it s better to use the date picker form alibaba go(it s an app that shows diff features and code is on github: https://github.com/alibaba/flutter-go thx yaochao for this link) cuz their date picker has what day it is in the week(Mon,Tue,Wen...) and the time picker does not have sec in the select options 
5.2 to get ride of the sec column when pick a time u need to go to the source file of the DatePicker and then go into BasePickerModel s source file and modify the rightSideColumn or something to get ride of the sec column (actucally it wont work cuz we r loading it from the interenet i think. so ur modificaiton wont got transfered to the copy on each phone. so it s not the local file u upload to their phone when they download the app)
6. 9/18-9/22 (5d) finished the edit pg besides the change ordered service quantity since web front havent even touched/test it(i could not use the api for the task); cleaned up some mess(but still a lot more and most of them is my note i wont clean my notes until i finish v1)(got ride of old files: screens widgets from the online course); time edit is linked to backend; refresh feature added; moved time logic to products time retrive f is set up for better way of doing time thing but not utalized yet(current way s ok); bot nav remade, the one i got online was not good when i try to link pages to btn(weird it shouldn't be; since it s an easy feature) so i hade to make one myself; list went behind bot nav bar bug fixed;
6.1 refresh feature need to be add to req pg and order list pg since i only made it work for sttless widget but not sttful. also better layour(organize code) needed to be done for those sttful pgs (actually refresh might be only for sttless w not for sttful so we r good, actaully it still needed cuz i acutally triggered refresh from order detail pg to refresh req pg kind of. but if u update from postman then req pg wont refresh/update)
6.2 i might introduced some redudency with duplicated ways for the same thing(_serv vs services "in product") in setting pg there s the better way using "loadedproduct.emailV" 
6.3 bot nav need a final touch when nav to other pages that is not part of the bot nav bar the highlight should be turned off
6.4 nav bot touchable area need to be increased
7. 9/25-9/29 (5d) fixed service time change (cuz i broke it); orderlist filter updated there was some dummy data. now i liked to back end; req pg updated cuz it was loading all orders not just the req orders; 
7.1 this should be in #6 but i did not explain it there(in #6 which is right above) regarding to service time change has flauss when u changed the time and do not click the back btn and instead, u click build in android physical back btn the detail pg wont refresh but i ll just disable the back btn on the phone then this ll be "ok" but yea in the future some word need to be done to fix it
7.2 i might broke refresh on detail pg somehow. actually i did it on purpose last week. cuz if not so then there ll be an infi loop and i tried to use the cusumer to solve it but that s how i introduced the secound bug i was trying to debug this week. it caused req pg and detail showing diff time which s weird cuz i thought they r both from the same prods data but the one from consumer was weird i eventually found out about it. 
7.3 try await need some feedback if there s err with api for time change also in edit pg back btn need some waiting/loading fb
7.4 i fixed the stupid/redundent code layout thing and presented in confirm pg but havent move it or change it for other pages 
7.5 (here r some bug/work that s need to be done but i havent touched them yet. this is form the note i have but i ll try to put them here for people to see) 
forgot pg
register
img up register
go back btn await loading circle
android back btn disable on go back pg
14:1 vs 14:01 service time
?loading on loadpic is not working so can get ride of 
copy address should be posible or even available with a btn
status footer need to stick to bot also box should expand auto with space needed
go to ToDo pg need to be linked 
8. 10/2 set up chat history page and websocket usage and connections but chat history from api only capture the newest chat and websocket needs the right connecting link. the linke from the front end is kind of confusing, what s chaturl i thought it s chatid but it may not be. 
10.1 werid bug cant pass data through bot nav bar to pages linked to bot nav bar. it works on and off sometime it has err some time seems fine. and i comment out the loadpic on msg/chat page which ll make the bug consistent meaning it ll occur everytime if u uncomment it. this should not be like this. anyway it s a weird bug and possible fix d be call the method to get the data from prods in bot nav bar instead of on those actual pages. and get those data right in the nav bar and them pass them into those pages(chat and setting). pass data with ModalRoute.of(context).settings.arguments before i was calling methods and got the data from prods right in those pages af rendering from the nav bar which may caused this bug.   
 

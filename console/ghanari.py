import os
import mysql.connector as mc
from colorama import Fore, Style, Back

mydb = mc.connect(
    user=os.environ.get("MYSQL_USER", "root"),
    passwd=os.environ.get("MYSQL_PASSWORD", ""),
    host=os.environ.get("MYSQL_HOST", "127.0.0.1"),
    database=os.environ.get("MYSQL_DATABASE", "Ghanari"),
)

mycursor = mydb.cursor()

print(
    Fore.BLUE + Style.NORMAL + Back.BLACK + "**************************/| WELCOME TO GHANARI |\**************************************\n"

                                            "                            here's a guide to use the features of app                                \n"
                                            "sign up ====>  1\n"
                                            "sign in ====> 2\n"
                                            "get a user's login list ====> 3\n"
                                            "tweet sth on your account ====> 4\n"
                                            "read your own tweets ====> 5\n"
                                            "follow another user ====> 6\n"
                                            "unfollow a following user ====> 7\n"
                                            "block a user ====> 8\n"
                                            "unblock a user that you had blocked ====> 9\n"
                                            "read tweets of your following users ====> 10\n"
                                            "read an arbitrary user's tweets ====> 11\n"
                                            "comment on a tweet ====> 12\n"
                                            "read comments of a tweet ====> 13\n"
                                            "insert a hashtag to one of your own tweets ====> 14\n"
                                            "read tweets of an arbitrary hashtag ====> 15\n"
                                            "like a tweet ====> 16\n"
                                            "check how many likes does a tweet have ====> 17\n"
                                            "get the list of users who liked a tweet ====> 18\n"
                                            "read the most liked tweets ====> 19\n"
                                            "send an existing tweet as a message to a user ====> 20\n"
                                            "send a text message to a user ====> 21\n"
                                            "read messages that you received from an arbitrary user ====> 22\n"
                                            "get the list of users who sent a message to you ====> 23\n" + Fore.CYAN + Back.RESET)


while (True):
    try:
        print("enter number of your arbitrary feature:")
        choice = int(input())

        if choice == 0:
            print(Fore.LIGHTCYAN_EX + Back.BLACK + "We hope you had a good time in ghanari:)\n"
                                                           "goodbye!" + Fore.CYAN + Back.RESET)
            break

        elif choice == 1:
            print("Please enter your firstname(mostly 20 characters):")
            fname = input()
            print("Please enter your lastname(mostly 20 characters):")
            lname = input()
            print("Please enter your username(mostly 20 characters):")
            uname = input()
            print("Please enter your password:")
            passwrd = input()
            print("Please enter your birth date like YYYYMMDD:")
            birthDate = input()
            print("Please enter your biography(mostly 64 characters):")
            bio = input()
            mycursor.callproc("create_account", [fname, lname, uname, passwrd, birthDate, bio])


        elif choice == 2:
            print("Please enter your username:")
            uname = input()
            print("Please enter your password:")
            passwrd = input()
            mycursor.callproc("login_account", [uname, passwrd])

            st = "call login_account('{}' , '{}')".format(uname, passwrd)
            mycursor.callproc("row_cnt", [st])
            for x in mycursor.stored_results():
                xlist = x.fetchall()
                st1 = str(xlist[0]).replace("(", "", 2)
                st2 = str(xlist[0]).replace(")", "", 2)
                st3 = str(xlist[0]).replace(",", "")
                n = int("{}".format(st3[1]))
                if (n == 0):
                    print(Fore.WHITE + Back.BLACK + "entered username or password is wrong!" + Fore.CYAN + Back.RESET)


        elif choice == 3:
            print("Please enter a username:")
            uname = input()
            mycursor.callproc("check_user_logins", [uname])
            for i in mycursor.stored_results():
                rlist = i.fetchall()
                for row in rlist:
                    print(Fore.WHITE + Back.BLACK + " {} ".format(row[0]))
                    print("_____________________________________________________________" + Fore.CYAN + Back.RESET)


        elif choice == 4:
            print("Please enter the content of tweet:")
            content = input()
            mycursor.callproc("send_tweet", [content])



        elif choice == 5:
            mycursor.callproc("get_personal_tweets")
            for i in mycursor.stored_results():
                rlist = i.fetchall()
                for row in rlist:
                    print(Fore.WHITE + Back.BLACK + "{} | {}                 |{} ".format(row[0], row[1], row[2]))
                    print("_____________________________________________________________" + Fore.CYAN + Back.RESET)


        elif choice == 6:
            print("Please enter a username:")
            uname = input()
            mycursor.callproc("follow_user", [uname])




        elif choice == 7:
            print("Please enter a username:")
            uname = input()
            mycursor.callproc("unfollow_user", [uname])


        elif choice == 8:
            print("Please enter a username:")
            uname = input()
            mycursor.callproc("block_user", [uname])


        elif choice == 9:
            print("Please enter a username:")
            uname = input()
            mycursor.callproc("unblock_user", [uname])


        elif choice == 10:
            mycursor.callproc("get_following_tweets")
            for i in mycursor.stored_results():
                rlist = i.fetchall()
                for row in rlist:
                    print(Fore.WHITE + Back.BLACK + "{} | {} : {} ".format(row[0], row[1], row[2]))
                    print("_____________________________________________________________" + Fore.CYAN + Back.RESET)


        elif choice == 11:
            print("Please enter a username:")
            uname = input()
            mycursor.callproc("get_a_user_tweets", [uname])
            for i in mycursor.stored_results():
                rlist = i.fetchall()
                for row in rlist:
                    print(Fore.WHITE + Back.BLACK + "{} | {}              |{} ".format(row[0], row[1], row[2]))
                    print("_____________________________________________________________" + Fore.CYAN + Back.RESET)


        elif choice == 12:
            print("Please enter the id of a tweet:")
            ID = int(input())
            print("Please enter the content of comment:")
            cont = input()
            mycursor.callproc("send_comment", [ID, cont])


        elif choice == 13:
            print("Please enter the id of a tweet:")
            ID = int(input())
            mycursor.callproc("get_comments_of_tweet", [ID])
            for i in mycursor.stored_results():
                rlist = i.fetchall()
                for row in rlist:
                    print(Fore.WHITE + Back.BLACK + "{}: {}        | {}".format(row[0], row[1], row[2]))
                    print("_____________________________________________________________" + Fore.CYAN + Back.RESET)


        elif choice == 14:
            print("Please enter a hashtag:")
            hashtag = input()
            print("Please enter the id of one of your own tweets:")
            ID = int(input())
            mycursor.callproc("insert_hashtag_to_tweet", [hashtag, ID])


        elif choice == 15:
            print("Please enter a hashtag:")
            hashtag = input()
            mycursor.callproc("get_tweets_with_a_hashtag", [hashtag])
            for i in mycursor.stored_results():
                rlist = i.fetchall()
                for row in rlist:
                    print(Fore.WHITE + Back.BLACK + "{} | {}: {}        | {}".format(row[0], row[1], row[2], row[3]))
                    print("_____________________________________________________________" + Fore.CYAN + Back.RESET)


        elif choice == 16:
            print("Please enter the id of a tweet:")
            ID = int(input())
            mycursor.callproc("add_favorite", [ID])

            st = "call add_favorite('{}')".format(ID)
            mycursor.callproc("row_cnt", [st])
            for x in mycursor.stored_results():
                xlist = x.fetchall()
                st1 = str(xlist[0]).replace("(", "", 2)
                st2 = str(xlist[0]).replace(")", "", 2)
                st3 = str(xlist[0]).replace(",", "")
                n = int("{}".format(st3[1]))
                if (n == 0):
                    print(Fore.WHITE + Back.BLACK + "you can't like tweets of this user." + Fore.CYAN + Back.RESET)


        elif choice == 17:
            print("Please enter the id of a tweet:")
            ID = int(input())
            mycursor.callproc("get_count_favorites", [ID])
            for i in mycursor.stored_results():
                out = i.fetchall()
                st1 = str(out[0]).replace("(", "", 2)
                st2 = str(out[0]).replace(")", "", 2)
                st3 = str(out[0]).replace(",", "")
                n = int("{}".format(st3[1]))
                print(Fore.WHITE + Back.BLACK + "count of favorites: {}".format(n) + Fore.CYAN + Back.RESET)


        elif choice == 18:
            print("Please enter the id of a tweet:")
            ID = int(input())
            mycursor.callproc("get_list_of_likers", [ID])
            for i in mycursor.stored_results():
                rlist = i.fetchall()
                for row in rlist:
                    print(Fore.WHITE + Back.BLACK + " {} ".format(row[0]))
                    print("_____________________________________________________________" + Fore.CYAN + Back.RESET)


        elif choice == 19:
            mycursor.callproc("get_top_favorites")
            for i in mycursor.stored_results():
                rlist = i.fetchall()
                for row in rlist:
                    print(Fore.WHITE + Back.BLACK + " {}: {}      | {} | {}".format(row[0], row[1], row[3], row[2]))
                    print("_____________________________________________________________" + Fore.CYAN + Back.RESET)


        elif choice == 20:
            print("Please enter a username:")
            uname = input()
            print("Please enter the id of a tweet:")
            ID = int(input())
            mycursor.callproc("send_tweet_as_message", [uname, ID])

            st = "call send_tweet_as_message('{}' , '{}')".format(uname, ID)
            mycursor.callproc("row_cnt", [st])
            for x in mycursor.stored_results():
                xlist = x.fetchall()
                st1 = str(xlist[0]).replace("(", "", 2)
                st2 = str(xlist[0]).replace(")", "", 2)
                st3 = str(xlist[0]).replace(",", "")
                n = int("{}".format(st3[1]))
                if (n == 0):
                    print(Fore.WHITE + Back.BLACK + "you can't send message to this user. / you can't send this tweet to this user." + Fore.CYAN + Back.RESET)


        elif choice == 21:
            print("Please enter a username:")
            uname = input()
            print("Please enter the content of message:")
            cont = input()
            mycursor.callproc("send_text_as_message", [uname, cont])

            st = "call send_text_as_message('{}' , '{}')".format(uname, cont)
            mycursor.callproc("row_cnt", [st])
            for x in mycursor.stored_results():
                xlist = x.fetchall()
                st1 = str(xlist[0]).replace("(", "", 2)
                st2 = str(xlist[0]).replace(")", "", 2)
                st3 = str(xlist[0]).replace(",", "")
                n = int("{}".format(st3[1]))
                if (n == 0):
                    print(Fore.WHITE + Back.BLACK + "you can't send message to this user." + Fore.CYAN + Back.RESET)


        elif choice == 22:
            print("Please enter a username:")
            uname = input()
            mycursor.callproc("get_a_user_messages", [uname])
            for i in mycursor.stored_results():
                rlist = i.fetchall()
                for row in rlist:
                    st = " {} | {} : {}{}           |{}".format(row[0], row[1], row[2], row[3], row[4]).replace("None", "")
                    print(
                        Fore.WHITE + Back.BLACK + st)
                    print("_____________________________________________________________" + Fore.CYAN + Back.RESET)


        elif choice == 23:
            mycursor.callproc("check_message_senders")
            for i in mycursor.stored_results():
                rlist = i.fetchall()
                for row in rlist:
                    print(Fore.WHITE + Back.BLACK + " {} ".format(row[0]))
                    print("______________________________________________________________" + Fore.CYAN + Back.RESET)

        mydb.commit()
        print("done!")

    except:
        print(Fore.LIGHTCYAN_EX + Back.BLACK + "wrong input!" + Fore.CYAN + Back.RESET)
        continue

mydb.close()


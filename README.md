# README

GET http://localhost:3000/users

filter
    filter[name]=Marcos
paginate
    page[number]=1
    page[size]=10


GET http://localhost:3000/events

filter
    filter[name]=Mangafest
paginate
    page[number]=1
    page[size]=10


GET http://localhost:3000/assistants

filter
    filter[user]=Marcos
    filter[event_id]=1
    filter[paid_out]=[true || false]
paginate
    page[number]=1
    page[size]=10
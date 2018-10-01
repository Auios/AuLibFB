'AuSQL.bi
'9/15/2017

#include once "mysql\mysql.bi"
#define NULL 0

type MySQLDatabase
    as string host, user, pass, dbName
    as uinteger port, flag
    
    as MYSQL ptr conn
    as MYSQL_RES ptr res
    as MYSQL_ROW row
    
    declare function Connect(host as string, user as string, pass as string, dbName as string, port as uinteger = 3306, flag as uinteger = 0) as integer
    declare function GetError() as string
    declare function GetErrorMessage() as string
    declare function GetErrorNo() as uinteger
    declare function Query(stmt as string) as integer
    declare function GetRowCount() as uinteger
    declare function GetFieldCount() as uinteger
    declare function GetRow() as integer
    declare function GetItem(index as uinteger) as string
    declare sub close()
end type

function MySQLDatabase.Connect(host as string, user as string, pass as string, dbName as string, port as uinteger = 3306, flag as uinteger = 0) as integer
    this.conn = mysql_init(NULL)
    this.host = host
    this.user = user
    this.pass = pass
    this.dbName = dbName
    this.port = port
    this.flag = flag
    if(mysql_real_connect(this.conn, this.host, this.user, this.pass, this.dbName, this.port, NULL, this.flag) = NULL) then
        return 1
    else
        return 0
    end if
end function

function MySQLDatabase.GetError() as string
    return "ERROR " & this.getErrorNo() & ": " & this.getErrorMessage()
end function

function MySQLDatabase.GetErrorMessage() as string
    return "'" & mysql_error(this.conn) & "'"
end function

function MySQLDatabase.GetErrorNo() as uinteger
    return mysql_errNo(this.conn)
end function

function MySQLDatabase.Query(stmt as string) as integer
    dim as integer result = mysql_query(this.conn, stmt)
    if(result = 0) then
        mysql_free_result(this.res)
        this.res = mysql_store_result(this.conn)
    end if
    return result
end function

function MySQLDatabase.GetRowCount() as uinteger
    return mysql_num_rows(this.res)
end function

function MySQLDatabase.GetFieldCount() as uinteger
    return mysql_num_fields(this.res)
end function

function MySQLDatabase.GetRow() as integer
    this.row = mysql_fetch_row(this.res)
    if(row = NULL) then
        return 0
    else
        return 1
    end if
end function

function MySQLDatabase.GetItem(index as uinteger) as string
    return *this.row[index]
end function

sub MySQLDatabase.Close()
    mysql_close(this.conn)
end sub

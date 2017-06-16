Partial Class BambooAPIClient

    Private Async Function getLists() As Task(Of BambooHTTPResponse)
        Dim request As BambooHTTPRequest = New BambooHTTPRequest()

        request.method = "GET"
        request.url = String.Format("{0}/v1/meta/lists", Me.baseUrl)

        Dim res = Await http.sendRequest(request)

        Return res
    End Function

    Public Async Function getJobTitles() As Task(Of List(Of String))
        Dim allList As String
        Dim DS_AllLists As New DataSet
        Dim LC_ListID As String
        Dim Lst_Return As New List(Of String)
        Try
            Dim res = Await getLists()

            allList = res.getContentString()
            If allList <> "" Then
                DS_AllLists.ReadXml(New IO.StringReader(allList))

                LC_ListID = DS_AllLists.Tables("list").Select("alias = 'jobTitle'")(0)("list_id")
                For Each dr As DataRow In DS_AllLists.Tables("option").Select("options_id = '" & LC_ListID & "'")
                    Lst_Return.Add(dr("option_Text"))
                Next

            End If

            Return Lst_Return
        Catch ex As Exception
            Throw ex
        End Try

    End Function

    Public Async Function getEmployeeDirectory() As Task(Of BambooHTTPResponse)
        Dim request As BambooHTTPRequest = New BambooHTTPRequest()
        Try

            request.method = "GET"
            request.url = String.Format("{0}/v1/employees/directory", Me.baseUrl)

            Dim res = Await http.sendRequest(request)

            Return res
        Catch ex As Exception
            Throw ex
        End Try

    End Function

    Public Async Function DQLogin(ByVal apikey As String, ByVal userName As String, ByVal password As String) As Task(Of String)
        Dim request As BambooHTTPRequest = New BambooHTTPRequest()
        request.method = "POST"
        request.url = String.Format("{0}/v1/login", Me.baseUrl)


        request.contentType = "application/x-www-form-urlencoded"
        request.headers("applicationKey") = apikey
        request.headers("user") = userName
        request.headers("password") = password


        Dim res As BambooHTTPResponse = Await http.sendRequest(request)

        Return res.getContentString()

    End Function
End Class

object WebModuleServer: TWebModuleServer
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModuleServerDefaultHandlerAction
    end>
  Height = 129
  Width = 181
  object DSServer: TDSServer
    Left = 51
    Top = 11
  end
  object DSHTTPWebDispatcher: TDSHTTPWebDispatcher
    Server = DSServer
    Filters = <>
    WebDispatch.PathInfo = 'datasnap*'
    Left = 51
    Top = 66
  end
  object DSServerClass: TDSServerClass
    OnGetClass = DSServerClassGetClass
    Server = DSServer
    Left = 119
    Top = 10
  end
end

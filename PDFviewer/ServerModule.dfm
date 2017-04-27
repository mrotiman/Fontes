object UniServerModule: TUniServerModule
  OldCreateOrder = False
  OnCreate = UniGUIServerModuleCreate
  AutoCoInitialize = False
  FilesFolder = 'files\'
  TempFolder = 'temp\'
  SessionTimeout = 600000
  Title = 'New Application'
  BGColor = 8404992
  CharSet = 'utf-8'
  FaviconOptions = [foVisible, foLocalCache]
  AjaxTimeout = 30000
  DefaultImageFormat = cfJpeg
  UseGlobalImageCache = True
  SuppressErrors = []
  UnavailableErrMsg = 'Server unavailable, please try later'
  LoadingMessage = 'Loading...'
  Bindings = <>
  MainFormDisplayMode = mfWindow
  CustomFiles.Strings = (
    'pdf\build\pdf.js'
    'pdf\build\pdf.worker.js')
  CustomMeta.Strings = (
    '<meta http-equiv="Pragma" content="no-cache"/>  '
    '<meta http-equiv="Cache-Control" content="no-cache"/>  '
    '<meta http-equiv="Expires" content="0"/>')
  ServerMessages.ExceptionTemplate.Strings = (
    '<html>'
    '<body bgcolor="#dfe8f6">'
    
      '<p style="text-align:center;color:#A05050">An Exception has occu' +
      'red in application:</p>'
    '<p style="text-align:center;color:#0000A0">[###message###]</p>'
    
      '<p style="text-align:center;color:#A05050"><a href="[###url###]"' +
      '>Restart application</a></p>'
    '</body>'
    '</html>')
  ServerMessages.InvalidSessionTemplate.Strings = (
    '<html>'
    '<body bgcolor="#dfe8f6">'
    '<p style="text-align:center;color:#0000A0">[###message###]</p>'
    
      '<p style="text-align:center;color:#A05050"><a href="[###url###]"' +
      '>Restart application</a></p>'
    '</body>'
    '</html>')
  ServerMessages.TerminateTemplate.Strings = (
    '<html>'
    '<body bgcolor="#dfe8f6">'
    '<p style="text-align:center;color:#0000A0">[###message###]</p>'
    
      '<p style="text-align:center;color:#A05050"><a href="[###url###]"' +
      '>Restart application</a></p>'
    '</body>'
    '</html>')
  ServerMessages.InvalidSessionMessage = 'Invalid session or session Timeout.'
  ServerMessages.TerminateMessage = 'Web session terminated.'
  ExtLocale = '[Auto]'
  Compression.MinTextSize = 512
  SSL.SSLOptions.RootCertFile = 'root.pem'
  SSL.SSLOptions.CertFile = 'cert.pem'
  SSL.SSLOptions.KeyFile = 'key.pem'
  SSL.SSLOptions.Method = sslvSSLv3
  SSL.SSLOptions.SSLVersions = [sslvSSLv3]
  SSL.SSLOptions.Mode = sslmUnassigned
  SSL.SSLOptions.VerifyMode = []
  SSL.SSLOptions.VerifyDepth = 0
  Height = 150
  Width = 215
end

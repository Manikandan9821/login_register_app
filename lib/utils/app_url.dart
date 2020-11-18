class AppUrl{
    //https://api.backendless.com/D8065324-3648-BA75-FF13-B8D839BA0400/72858A17-7CA1-452C-9390-EC00F1A5F9A8/users/register

    static const String _url = 'https://api.backendless.com/';
    static const String _app_id = 'D8065324-3648-BA75-FF13-B8D839BA0400/';
    static const String _api_key = '72858A17-7CA1-452C-9390-EC00F1A5F9A8/';

    static const String _base_url =  _url+_app_id+_api_key;

    static const String register = _base_url + 'users/register';
    static const String login = _base_url + 'users/login';
}
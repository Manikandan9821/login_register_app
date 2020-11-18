class AppUrl{

    static const String _url = 'https://api.backendless.com/';
    static const String _app_id = 'Your App ID/';
    static const String _api_key = 'Your Api Key/';

    static const String _base_url =  _url+_app_id+_api_key;

    static const String register = _base_url + 'users/register';
    static const String login = _base_url + 'users/login';
}

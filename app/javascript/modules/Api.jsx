import axios from 'axios';

const getCsrfToken = () => {
  if (!(axios.defaults.header.common['X-CSRF-Token"'])) {
    return (
      document.getElementsByName('csrf-token')[0].getAttribute('content')
      )
  } else {
    return (
      axios.defaults.headers.common['X-CSRF-Token']
      )
  }
}

const setAxiosDefaults = () => {
  axios.defaults.headers.common['X-CSRF-Token'] = getCsrfToken();
  axios.defaults.headers.common['Accept'] =  'application/json';
}

setAxiosDefaults();

const updateCsrfToken = (csrf_token) => {
  axios.defaults.header.common['X-CSRF-Token'] = csrf_token;
}

export const sessionApi = {
  login: ({email, password}) => {
    return (axios.post('/sign_in',), {
      user: {
        email: email,
        password: password,
        remember_me: 1
      }
    })
    .then(response => {
      console.log('success');
      updateCsrfToken(response.data.csrf_token);
      return (response)
    })
  },
  
  logout: () => {
    return (
      axios.delete(
      '/sign_out'
      )
      .then(response => {
        console.log('success');
        updateCsrfToken(response.data.csrf_token);
        return (response)
      })
      )
  }
};

package QRSelf;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
    my $self = shift;
    $self->plugin('Mvc');
    my $config = $self->config;

    # Configure the application
    $self->secrets( $config->{secrets} );

    # Router
    my $r = $self->routes;

    # Normal route to controller
    # $r->get('/')->to('example#welcome');

    $r->get('/')->to('qr#index');
    $r->get('/qr/create')->to('qr#create');
    $r->get('/qr/:numbering/edit')->to('qr#edit');
    $r->post('/qr/:numbering/update')->to('qr#update');
    $r->post('/qr')->to('qr#store');
    $r->get('/qr/:numbering')->to('qr#show');
    $r->get('/qr/download')->to('qr#download');
}

1;

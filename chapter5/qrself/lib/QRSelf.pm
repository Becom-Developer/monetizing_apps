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
    $r->get('/')->to('example#welcome');
}

1;

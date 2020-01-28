package QRSelf::Controller::Qr;
use Mojo::Base 'QRSelf::Controller::Base';

sub index {
    my $self     = shift;
    my $template = 'qr/index';
    $self->stash(
        template => $template,
        format   => 'html',
        handler  => 'ep',
    );
    $self->render();
    return;
}

sub create {
    my $self     = shift;
    my $template = 'qr/create';
    $self->stash(
        template => $template,
        format   => 'html',
        handler  => 'ep',
    );
    $self->render();
    return;
}

sub edit {
    my $self     = shift;
    my $template = 'qr/edit';
    $self->stash(
        template => $template,
        format   => 'html',
        handler  => 'ep',
    );
    $self->render();
    return;
}

sub update {
    my $self = shift;
    $self->render( text => 'update' );
    return;
}

sub store {
    my $self = shift;
    $self->render( text => 'store' );
    return;
}

sub show {
    my $self     = shift;
    my $template = 'qr/show';
    $self->stash(
        template => $template,
        format   => 'html',
        handler  => 'ep',
    );
    $self->render();
    return;
}

sub download {
    my $self = shift;
    $self->render( text => 'download' );
    return;
}

1;

<?php


namespace App\Listener;



use Lexik\Bundle\JWTAuthenticationBundle\Event\AuthenticationSuccessEvent;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\Security\Core\User\UserInterface;

class AuthenticationSuccessListener
{
    public function __construct(Security $security)
    {
        $this->security = $security;
    }
    public function onAuthenticationSuccessResponse(AuthenticationSuccessEvent $event)
    {
        $data = $event->getData();
        $user = $event->getUser();

        if(!$user instanceof UserInterface)
        {
            return;
        }

        $data["id"] = $user->getId();
        $event->setData($data);

    }
}

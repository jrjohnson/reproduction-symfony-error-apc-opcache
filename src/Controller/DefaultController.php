<?php
namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Contracts\Cache\CacheInterface;

class DefaultController
{
    public function index(CacheInterface $appCache): Response
    {
        return $appCache->get('randomint', function (){
            $number = random_int(0, 100);

            return new Response(
                '<html><body>Lucky number: '.$number.'</body></html>'
            );
        });
    }
}

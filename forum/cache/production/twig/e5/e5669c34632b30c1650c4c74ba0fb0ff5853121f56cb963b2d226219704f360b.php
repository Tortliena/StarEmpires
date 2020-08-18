<?php

use Twig\Environment;
use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Extension\SandboxExtension;
use Twig\Markup;
use Twig\Sandbox\SecurityError;
use Twig\Sandbox\SecurityNotAllowedTagError;
use Twig\Sandbox\SecurityNotAllowedFilterError;
use Twig\Sandbox\SecurityNotAllowedFunctionError;
use Twig\Source;
use Twig\Template;

/* user_welcome.txt */
class __TwigTemplate_0944d5914c77888a6f9dbdd0ddbedd6abeff1072ca51af1246b079423226a0b1 extends \Twig\Template
{
    private $source;
    private $macros = [];

    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->source = $this->getSourceContext();

        $this->parent = false;

        $this->blocks = [
        ];
    }

    protected function doDisplay(array $context, array $blocks = [])
    {
        $macros = $this->macros;
        // line 1
        echo "Subject: Bienvenue sur les forums de « ";
        echo ($context["SITENAME"] ?? null);
        echo " »

";
        // line 3
        echo ($context["WELCOME_MSG"] ?? null);
        echo "

Conservez ce courriel dans vos archives. Les informations de votre compte sont les suivantes :

----------------------------
Nom d’utilisateur : ";
        // line 8
        echo ($context["USERNAME"] ?? null);
        echo "

Adresse du forum : ";
        // line 10
        echo ($context["U_BOARD"] ?? null);
        echo "
----------------------------

Votre mot de passe a été stocké de manière sécurisée dans notre base de données et ne pourra pas être retrouvé. Dans le cas où vous l’auriez oublié, vous pourrez le réinitialiser en utilisant l’adresse courriel associée à votre compte.

Merci de vous être enregistré.

";
        // line 17
        echo ($context["EMAIL_SIG"] ?? null);
        echo "
";
    }

    public function getTemplateName()
    {
        return "user_welcome.txt";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  66 => 17,  56 => 10,  51 => 8,  43 => 3,  37 => 1,);
    }

    public function getSourceContext()
    {
        return new Source("", "user_welcome.txt", "");
    }
}

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

/* contact_admin.txt */
class __TwigTemplate_5b596f19fd40d7e94e6cfcd63d8f9514392c42319748ff9617d7221a14d88af3 extends \Twig\Template
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
        echo "
Bonjour ";
        // line 2
        echo ($context["TO_USERNAME"] ?? null);
        echo ",

Ce qui suit est un courriel qui vous a été envoyé depuis la page de contact de « ";
        // line 4
        echo ($context["SITENAME"] ?? null);
        echo " ».

";
        // line 6
        if (($context["S_IS_REGISTERED"] ?? null)) {
            // line 7
            echo "Le message a été envoyé depuis un compte du forum.
Non d’utilisateur : ";
            // line 8
            echo ($context["FROM_USERNAME"] ?? null);
            echo "
Adresse courriel : ";
            // line 9
            echo ($context["FROM_EMAIL_ADDRESS"] ?? null);
            echo "
Adresse IP : ";
            // line 10
            echo ($context["FROM_IP_ADDRESS"] ?? null);
            echo "
Profil : ";
            // line 11
            echo ($context["U_FROM_PROFILE"] ?? null);
            echo "
";
        } else {
            // line 13
            echo "Le message a été envoyé par un invité qui a indiqué les informations de contact suivantes :
Nom : ";
            // line 14
            echo ($context["FROM_USERNAME"] ?? null);
            echo "
Adresse courriel : ";
            // line 15
            echo ($context["FROM_EMAIL_ADDRESS"] ?? null);
            echo "
Adresse IP : ";
            // line 16
            echo ($context["FROM_IP_ADDRESS"] ?? null);
            echo "
";
        }
        // line 18
        echo "

Voici le message qui vous a été envoyé :
~~~~~~~~~~~~~~~~~~~~~~~~~~~

";
        // line 23
        echo ($context["MESSAGE"] ?? null);
        echo "
";
    }

    public function getTemplateName()
    {
        return "contact_admin.txt";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  95 => 23,  88 => 18,  83 => 16,  79 => 15,  75 => 14,  72 => 13,  67 => 11,  63 => 10,  59 => 9,  55 => 8,  52 => 7,  50 => 6,  45 => 4,  40 => 2,  37 => 1,);
    }

    public function getSourceContext()
    {
        return new Source("", "contact_admin.txt", "");
    }
}

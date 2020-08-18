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
class __TwigTemplate_58beb8609d484fd7c34da5ede0636264a078b3d0f559e3c70b8dfef47f9e0dc7 extends \Twig\Template
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
Hello ";
        // line 2
        echo ($context["TO_USERNAME"] ?? null);
        echo ",

The following is an e-mail sent to you through the administration contact page on \"";
        // line 4
        echo ($context["SITENAME"] ?? null);
        echo "\".

";
        // line 6
        if (($context["S_IS_REGISTERED"] ?? null)) {
            // line 7
            echo "The message has been sent from an account on the site.
Username: ";
            // line 8
            echo ($context["FROM_USERNAME"] ?? null);
            echo "
E-mail address: ";
            // line 9
            echo ($context["FROM_EMAIL_ADDRESS"] ?? null);
            echo "
IP Address: ";
            // line 10
            echo ($context["FROM_IP_ADDRESS"] ?? null);
            echo "
Profile: ";
            // line 11
            echo ($context["U_FROM_PROFILE"] ?? null);
            echo "
";
        } else {
            // line 13
            echo "The message was sent from a guest who specified the following contact information:
Name: ";
            // line 14
            echo ($context["FROM_USERNAME"] ?? null);
            echo "
E-mail address: ";
            // line 15
            echo ($context["FROM_EMAIL_ADDRESS"] ?? null);
            echo "
IP Address: ";
            // line 16
            echo ($context["FROM_IP_ADDRESS"] ?? null);
            echo "
";
        }
        // line 18
        echo "

Message sent to you follows
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

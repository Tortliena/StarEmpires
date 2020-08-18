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

/* mcp_topic.html */
class __TwigTemplate_2d83eb2f675846d79d24cba02b592fd7d9f22e2ccf898f3324ba17712dea9112 extends \Twig\Template
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
        $location = "mcp_header.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("mcp_header.html", "mcp_topic.html", 1)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
        // line 2
        echo "
<div class=\"tabs-container\">
<h2><a href=\"";
        // line 4
        echo ($context["U_VIEW_TOPIC"] ?? null);
        echo "\">";
        echo $this->extensions['phpbb\template\twig\extension']->lang("TOPIC");
        echo $this->extensions['phpbb\template\twig\extension']->lang("COLON");
        echo " ";
        echo ($context["TOPIC_TITLE"] ?? null);
        echo "</a></h2>

";
        // line 6
        if (($context["S_MERGE_VIEW"] ?? null)) {
            // line 7
            echo "\t";
            $value = "merge-panel";
            $context['definition']->set('SHOW_PANEL', $value);
        } elseif (        // line 8
($context["S_SPLIT_VIEW"] ?? null)) {
            // line 9
            echo "\t";
            $value = "split-panel";
            $context['definition']->set('SHOW_PANEL', $value);
        } else {
            // line 11
            echo "\t";
            $value = "display-panel";
            $context['definition']->set('SHOW_PANEL', $value);
        }
        // line 13
        echo "
<div id=\"minitabs\" class=\"minitabs sub-panels\" data-show-panel=\"";
        // line 14
        echo twig_get_attribute($this->env, $this->source, ($context["definition"] ?? null), "SHOW_PANEL", [], "any", false, false, false, 14);
        echo "\" role=\"tablist\">
\t<ul>
\t\t<li id=\"display-panel-tab\" class=\"tab";
        // line 16
        if ( !($context["S_MERGE_VIEW"] ?? null)) {
            echo " activetab";
        }
        echo "\">
\t\t\t<a href=\"#minitabs\" data-subpanel=\"display-panel\" role=\"tab\" aria-controls=\"display-panel\">";
        // line 17
        echo $this->extensions['phpbb\template\twig\extension']->lang("DISPLAY_OPTIONS");
        echo "</a>
\t\t</li>
\t\t<li id=\"split-panel-tab\" class=\"tab\">
\t\t\t<a href=\"#minitabs\" data-subpanel=\"split-panel\" role=\"tab\" aria-controls=\"split-panel\">";
        // line 20
        echo $this->extensions['phpbb\template\twig\extension']->lang("SPLIT_TOPIC");
        echo "</a>
\t\t</li>
\t\t<li id=\"merge-panel-tab\" class=\"tab";
        // line 22
        if (($context["S_MERGE_VIEW"] ?? null)) {
            echo " activetab";
        }
        echo "\">
\t\t\t<a href=\"#minitabs\" data-subpanel=\"merge-panel\" role=\"tab\" aria-controls=\"merge-panel\">";
        // line 23
        echo $this->extensions['phpbb\template\twig\extension']->lang("MERGE_POSTS");
        echo "</a>
\t\t</li>
\t</ul>
</div>
</div>

<form id=\"mcp\" method=\"post\" action=\"";
        // line 29
        echo ($context["S_MCP_ACTION"] ?? null);
        echo "\">

<div class=\"panel\">
\t<div class=\"inner\">

\t<fieldset id=\"display-panel\" class=\"fields2\" role=\"tabpanel\">
\t<dl>
\t\t<dt><label for=\"posts_per_page\">";
        // line 36
        echo $this->extensions['phpbb\template\twig\extension']->lang("POSTS_PER_PAGE");
        echo $this->extensions['phpbb\template\twig\extension']->lang("COLON");
        echo "</label><br /><span>";
        echo $this->extensions['phpbb\template\twig\extension']->lang("POSTS_PER_PAGE_EXPLAIN");
        echo "</span></dt>
\t\t<dd><input class=\"inputbox autowidth\" type=\"number\" min=\"0\" max=\"999999\" name=\"posts_per_page\" id=\"posts_per_page\" value=\"";
        // line 37
        echo ($context["POSTS_PER_PAGE"] ?? null);
        echo "\" /></dd>
\t</dl>
\t<dl>
\t\t<dt><label>";
        // line 40
        echo $this->extensions['phpbb\template\twig\extension']->lang("DISPLAY_POSTS");
        echo $this->extensions['phpbb\template\twig\extension']->lang("COLON");
        echo "</label></dt>
\t\t<dd>";
        // line 41
        echo ($context["S_SELECT_SORT_DAYS"] ?? null);
        echo "&nbsp;&nbsp;<label>";
        echo $this->extensions['phpbb\template\twig\extension']->lang("SORT_BY");
        echo " ";
        echo ($context["S_SELECT_SORT_KEY"] ?? null);
        echo "</label><label>";
        echo ($context["S_SELECT_SORT_DIR"] ?? null);
        echo "</label> <input type=\"submit\" name=\"sort\" value=\"";
        echo $this->extensions['phpbb\template\twig\extension']->lang("GO");
        echo "\" class=\"button2\" /></dd>
\t</dl>
\t</fieldset>

";
        // line 45
        if (($context["S_CAN_SPLIT"] ?? null)) {
            // line 46
            echo "\t<fieldset id=\"split-panel\" class=\"fields2\" role=\"tabpanel\">
\t\t<p>";
            // line 47
            echo $this->extensions['phpbb\template\twig\extension']->lang("SPLIT_TOPIC_EXPLAIN");
            echo "</p>

\t";
            // line 49
            if (($context["S_SHOW_TOPIC_ICONS"] ?? null)) {
                // line 50
                echo "\t\t<dl>
\t\t\t<dt><label for=\"icon\">";
                // line 51
                echo $this->extensions['phpbb\template\twig\extension']->lang("TOPIC_ICON");
                echo $this->extensions['phpbb\template\twig\extension']->lang("COLON");
                echo "</label></dt>
\t\t\t<dd><label for=\"icon\"><input type=\"radio\" name=\"icon\" id=\"icon\" value=\"0\" checked=\"checked\" /> ";
                // line 52
                echo $this->extensions['phpbb\template\twig\extension']->lang("NO_TOPIC_ICON");
                echo "</label>
\t\t\t";
                // line 53
                $context['_parent'] = $context;
                $context['_seq'] = twig_ensure_traversable(twig_get_attribute($this->env, $this->source, ($context["loops"] ?? null), "topic_icon", [], "any", false, false, false, 53));
                foreach ($context['_seq'] as $context["_key"] => $context["topic_icon"]) {
                    echo "<label for=\"icon-";
                    echo twig_get_attribute($this->env, $this->source, $context["topic_icon"], "ICON_ID", [], "any", false, false, false, 53);
                    echo "\"><input type=\"radio\" name=\"icon\" id=\"icon-";
                    echo twig_get_attribute($this->env, $this->source, $context["topic_icon"], "ICON_ID", [], "any", false, false, false, 53);
                    echo "\" value=\"";
                    echo twig_get_attribute($this->env, $this->source, $context["topic_icon"], "ICON_ID", [], "any", false, false, false, 53);
                    echo "\" ";
                    echo twig_get_attribute($this->env, $this->source, $context["topic_icon"], "S_ICON_CHECKED", [], "any", false, false, false, 53);
                    echo " /><img src=\"";
                    echo twig_get_attribute($this->env, $this->source, $context["topic_icon"], "ICON_IMG", [], "any", false, false, false, 53);
                    echo "\" width=\"";
                    echo twig_get_attribute($this->env, $this->source, $context["topic_icon"], "ICON_WIDTH", [], "any", false, false, false, 53);
                    echo "\" height=\"";
                    echo twig_get_attribute($this->env, $this->source, $context["topic_icon"], "ICON_HEIGHT", [], "any", false, false, false, 53);
                    echo "\" alt=\"\" title=\"\" /></label> ";
                }
                $_parent = $context['_parent'];
                unset($context['_seq'], $context['_iterated'], $context['_key'], $context['topic_icon'], $context['_parent'], $context['loop']);
                $context = array_intersect_key($context, $_parent) + $_parent;
                echo "</dd>
\t\t</dl>
\t";
            }
            // line 56
            echo "
\t";
            // line 57
            // line 58
            echo "\t<dl>
\t\t<dt><label for=\"subject\">";
            // line 59
            echo $this->extensions['phpbb\template\twig\extension']->lang("SPLIT_SUBJECT");
            echo $this->extensions['phpbb\template\twig\extension']->lang("COLON");
            echo "</label></dt>
\t\t<dd><input type=\"text\" name=\"subject\" id=\"subject\" size=\"45\" maxlength=\"124\" tabindex=\"2\" value=\"";
            // line 60
            echo ($context["SPLIT_SUBJECT"] ?? null);
            echo "\" title=\"";
            echo $this->extensions['phpbb\template\twig\extension']->lang("SPLIT_SUBJECT");
            echo "\" class=\"inputbox\" /></dd>
\t</dl>
\t";
            // line 62
            // line 63
            echo "\t<dl>
\t\t<dt><label>";
            // line 64
            echo $this->extensions['phpbb\template\twig\extension']->lang("SPLIT_FORUM");
            echo $this->extensions['phpbb\template\twig\extension']->lang("COLON");
            echo "</label></dt>
\t\t<dd><select name=\"to_forum_id\">";
            // line 65
            echo ($context["S_FORUM_SELECT"] ?? null);
            echo "</select></dd>
\t</dl>
\t</fieldset>
";
        }
        // line 69
        echo "
";
        // line 70
        if (($context["S_CAN_MERGE"] ?? null)) {
            // line 71
            echo "\t<fieldset id=\"merge-panel\" class=\"fields2\" role=\"tabpanel\">
\t\t<p>";
            // line 72
            echo $this->extensions['phpbb\template\twig\extension']->lang("MERGE_TOPIC_EXPLAIN");
            echo "</p>
\t<dl>
\t\t<dt><label for=\"to_topic_id\">";
            // line 74
            echo $this->extensions['phpbb\template\twig\extension']->lang("MERGE_TOPIC_ID");
            echo $this->extensions['phpbb\template\twig\extension']->lang("COLON");
            echo "</label></dt>
\t\t<dd>
\t\t\t<input class=\"inputbox autowidth\" type=\"number\" min=\"0\" max=\"9999999999\" name=\"to_topic_id\" id=\"to_topic_id\" value=\"";
            // line 76
            echo ($context["TO_TOPIC_ID"] ?? null);
            echo "\" />
\t\t\t<a href=\"";
            // line 77
            echo ($context["U_SELECT_TOPIC"] ?? null);
            echo "\" >";
            echo $this->extensions['phpbb\template\twig\extension']->lang("SELECT_TOPIC");
            echo "</a>
\t\t</dd>
\t\t";
            // line 79
            if (($context["TO_TOPIC_INFO"] ?? null)) {
                echo "<dd>";
                echo ($context["TO_TOPIC_INFO"] ?? null);
                echo "</dd>";
            }
            // line 80
            echo "\t</dl>
\t</fieldset>
";
        }
        // line 83
        echo "
\t</div>
</div>

<div class=\"panel\">
\t<div class=\"inner\">

\t<h3 id=\"review\" class=\"review\">
\t\t<span class=\"right-box\"><a href=\"#review\" onclick=\"viewableArea(getElementById('topicreview'), true); var rev_text = getElementById('review').getElementsByTagName('a').item(0).firstChild; if (rev_text.data == '";
        // line 91
        echo twig_escape_filter($this->env, $this->extensions['phpbb\template\twig\extension']->lang("EXPAND_VIEW"), "js");
        echo "'){rev_text.data = '";
        echo twig_escape_filter($this->env, $this->extensions['phpbb\template\twig\extension']->lang("COLLAPSE_VIEW"), "js");
        echo "'; } else if (rev_text.data == '";
        echo twig_escape_filter($this->env, $this->extensions['phpbb\template\twig\extension']->lang("COLLAPSE_VIEW"), "js");
        echo "'){rev_text.data = '";
        echo twig_escape_filter($this->env, $this->extensions['phpbb\template\twig\extension']->lang("EXPAND_VIEW"), "js");
        echo "'};\">";
        echo $this->extensions['phpbb\template\twig\extension']->lang("EXPAND_VIEW");
        echo "</a></span>
\t\t";
        // line 92
        echo $this->extensions['phpbb\template\twig\extension']->lang("TOPIC_REVIEW");
        echo $this->extensions['phpbb\template\twig\extension']->lang("COLON");
        echo " ";
        echo ($context["TOPIC_TITLE"] ?? null);
        // line 93
        echo "\t</h3>

\t<div id=\"topicreview\" class=\"topicreview\">
\t\t";
        // line 96
        $context['_parent'] = $context;
        $context['_seq'] = twig_ensure_traversable(twig_get_attribute($this->env, $this->source, ($context["loops"] ?? null), "postrow", [], "any", false, false, false, 96));
        $context['_iterated'] = false;
        foreach ($context['_seq'] as $context["_key"] => $context["postrow"]) {
            // line 97
            echo "\t\t";
            // line 98
            echo "\t\t<div class=\"post ";
            if ((twig_get_attribute($this->env, $this->source, $context["postrow"], "S_ROW_COUNT", [], "any", false, false, false, 98) % 2 == 1)) {
                echo "bg1";
            } else {
                echo "bg2";
            }
            echo "\">
\t\t\t<div class=\"inner\">

\t\t\t<div class=\"postbody\" id=\"pr";
            // line 101
            echo twig_get_attribute($this->env, $this->source, $context["postrow"], "POST_ID", [], "any", false, false, false, 101);
            echo "\">
\t\t\t\t<ul class=\"post-buttons\">
\t\t\t\t\t<li>
\t\t\t\t\t\t<a href=\"";
            // line 104
            echo twig_get_attribute($this->env, $this->source, $context["postrow"], "U_POST_DETAILS", [], "any", false, false, false, 104);
            echo "\" title=\"";
            echo $this->extensions['phpbb\template\twig\extension']->lang("POST_DETAILS");
            echo "\" class=\"button button-icon-only\">
\t\t\t\t\t\t\t<i class=\"icon fa-info fa-fw\" aria-hidden=\"true\"></i><span class=\"sr-only\">";
            // line 105
            echo $this->extensions['phpbb\template\twig\extension']->lang("POST_DETAILS");
            echo "</span>
\t\t\t\t\t\t</a>
\t\t\t\t\t</li>
\t\t\t\t\t<li>
\t\t\t\t\t\t<label for=\"post_id_list_select_";
            // line 109
            echo twig_get_attribute($this->env, $this->source, $context["postrow"], "POST_ID", [], "any", false, false, false, 109);
            echo "\">";
            echo $this->extensions['phpbb\template\twig\extension']->lang("SELECT");
            echo $this->extensions['phpbb\template\twig\extension']->lang("COLON");
            echo "
\t\t\t\t\t\t\t<input type=\"checkbox\" id=\"post_id_list_select_";
            // line 110
            echo twig_get_attribute($this->env, $this->source, $context["postrow"], "POST_ID", [], "any", false, false, false, 110);
            echo "\" name=\"post_id_list[]\" value=\"";
            echo twig_get_attribute($this->env, $this->source, $context["postrow"], "POST_ID", [], "any", false, false, false, 110);
            echo "\"";
            if (twig_get_attribute($this->env, $this->source, $context["postrow"], "S_CHECKED", [], "any", false, false, false, 110)) {
                echo " checked=\"checked\"";
            }
            echo " />
\t\t\t\t\t\t</label>
\t\t\t\t\t</li>
\t\t\t\t</ul>

\t\t\t\t";
            // line 115
            // line 116
            echo "\t\t\t\t<h3><a href=\"";
            echo twig_get_attribute($this->env, $this->source, $context["postrow"], "U_POST_DETAILS", [], "any", false, false, false, 116);
            echo "\">";
            echo twig_get_attribute($this->env, $this->source, $context["postrow"], "POST_SUBJECT", [], "any", false, false, false, 116);
            echo "</a></h3>
\t\t\t\t";
            // line 117
            // line 118
            echo "
\t\t\t\t";
            // line 119
            // line 120
            echo "\t\t\t\t<p class=\"author\">
\t\t\t\t\t<a href=\"";
            // line 121
            echo twig_get_attribute($this->env, $this->source, $context["postrow"], "U_MINI_POST", [], "any", false, false, false, 121);
            echo "\" title=\"";
            echo twig_get_attribute($this->env, $this->source, $context["postrow"], "MINI_POST", [], "any", false, false, false, 121);
            echo "\">
\t\t\t\t\t\t<i class=\"icon fa-file fa-fw icon-lightgray icon-tiny\" aria-hidden=\"true\"></i><span class=\"sr-only\">";
            // line 122
            echo twig_get_attribute($this->env, $this->source, $context["postrow"], "MINI_POST", [], "any", false, false, false, 122);
            echo "</span>
\t\t\t\t\t</a> ";
            // line 123
            echo $this->extensions['phpbb\template\twig\extension']->lang("POSTED");
            echo " ";
            echo twig_get_attribute($this->env, $this->source, $context["postrow"], "POST_DATE", [], "any", false, false, false, 123);
            echo " ";
            echo $this->extensions['phpbb\template\twig\extension']->lang("POST_BY_AUTHOR");
            echo " ";
            echo "<strong>";
            echo twig_get_attribute($this->env, $this->source, $context["postrow"], "POST_AUTHOR_FULL", [], "any", false, false, false, 123);
            echo "</strong>";
            if (twig_get_attribute($this->env, $this->source, $context["postrow"], "U_MCP_DETAILS", [], "any", false, false, false, 123)) {
                echo " [ <a href=\"";
                echo twig_get_attribute($this->env, $this->source, $context["postrow"], "U_MCP_DETAILS", [], "any", false, false, false, 123);
                echo "\">";
                echo $this->extensions['phpbb\template\twig\extension']->lang("POST_DETAILS");
                echo "</a> ]";
            }
            // line 124
            echo "\t\t\t\t</p>
\t\t\t\t";
            // line 125
            // line 126
            echo "
\t\t\t\t";
            // line 127
            if (twig_get_attribute($this->env, $this->source, $context["postrow"], "S_POST_UNAPPROVED", [], "any", false, false, false, 127)) {
                // line 128
                echo "\t\t\t\t<p class=\"post-notice unapproved\">
\t\t\t\t\t<a href=\"";
                // line 129
                echo twig_get_attribute($this->env, $this->source, $context["postrow"], "U_MCP_APPROVE", [], "any", false, false, false, 129);
                echo "\"><i class=\"icon fa-exclamation fa-fw icon-red\" aria-hidden=\"true\"></i><strong>";
                echo $this->extensions['phpbb\template\twig\extension']->lang("POST_UNAPPROVED");
                echo "</strong></a>
\t\t\t\t</p>
\t\t\t\t";
            }
            // line 132
            echo "
\t\t\t\t";
            // line 133
            if (twig_get_attribute($this->env, $this->source, $context["postrow"], "S_POST_DELETED", [], "any", false, false, false, 133)) {
                // line 134
                echo "\t\t\t\t<p class=\"post-notice deleted\">
\t\t\t\t\t<a href=\"";
                // line 135
                echo twig_get_attribute($this->env, $this->source, $context["postrow"], "U_MCP_APPROVE", [], "any", false, false, false, 135);
                echo "\"><strong>";
                echo $this->extensions['phpbb\template\twig\extension']->lang("POST_DELETED");
                echo "</strong></a>
\t\t\t\t</p>
\t\t\t\t";
            }
            // line 138
            echo "
\t\t\t\t";
            // line 139
            if (twig_get_attribute($this->env, $this->source, $context["postrow"], "S_POST_REPORTED", [], "any", false, false, false, 139)) {
                // line 140
                echo "\t\t\t\t<p class=\"post-notice reported\">
\t\t\t\t\t<a href=\"";
                // line 141
                echo twig_get_attribute($this->env, $this->source, $context["postrow"], "U_MCP_REPORT", [], "any", false, false, false, 141);
                echo "\"><i class=\"icon fa-exclamation fa-fw icon-red\" aria-hidden=\"true\"></i><strong>";
                echo $this->extensions['phpbb\template\twig\extension']->lang("POST_REPORTED");
                echo "</strong></a>
\t\t\t\t</p>
\t\t\t\t";
            }
            // line 144
            echo "
\t\t\t\t<div class=\"content\" id=\"message_";
            // line 145
            echo twig_get_attribute($this->env, $this->source, $context["postrow"], "POST_ID", [], "any", false, false, false, 145);
            echo "\">";
            echo twig_get_attribute($this->env, $this->source, $context["postrow"], "MESSAGE", [], "any", false, false, false, 145);
            echo "</div>

\t\t\t\t";
            // line 147
            // line 148
            echo "
\t\t\t\t";
            // line 149
            if (twig_get_attribute($this->env, $this->source, $context["postrow"], "S_HAS_ATTACHMENTS", [], "any", false, false, false, 149)) {
                // line 150
                echo "\t\t\t\t\t<dl class=\"attachbox\">
\t\t\t\t\t\t<dt>";
                // line 151
                echo $this->extensions['phpbb\template\twig\extension']->lang("ATTACHMENTS");
                echo "</dt>
\t\t\t\t\t\t";
                // line 152
                $context['_parent'] = $context;
                $context['_seq'] = twig_ensure_traversable(twig_get_attribute($this->env, $this->source, $context["postrow"], "attachment", [], "any", false, false, false, 152));
                foreach ($context['_seq'] as $context["_key"] => $context["attachment"]) {
                    // line 153
                    echo "\t\t\t\t\t\t\t<dd>";
                    echo twig_get_attribute($this->env, $this->source, $context["attachment"], "DISPLAY_ATTACHMENT", [], "any", false, false, false, 153);
                    echo "</dd>
\t\t\t\t\t\t";
                }
                $_parent = $context['_parent'];
                unset($context['_seq'], $context['_iterated'], $context['_key'], $context['attachment'], $context['_parent'], $context['loop']);
                $context = array_intersect_key($context, $_parent) + $_parent;
                // line 155
                echo "\t\t\t\t\t</dl>
\t\t\t\t";
            }
            // line 157
            echo "
\t\t\t\t";
            // line 158
            // line 159
            echo "
\t\t\t</div>

\t\t\t</div>
\t\t</div>
\t\t";
            $context['_iterated'] = true;
        }
        if (!$context['_iterated']) {
            // line 165
            echo "\t\t\t<p><strong>";
            echo $this->extensions['phpbb\template\twig\extension']->lang("NO_POSTS_TIME_FRAME");
            echo "</strong></p>
\t\t";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['postrow'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 167
        echo "\t</div>

\t<hr />

\t<div class=\"action-bar bar-bottom\">
\t\t<div class=\"pagination\">
\t\t\t";
        // line 173
        echo ($context["TOTAL_POSTS"] ?? null);
        echo "
\t\t\t";
        // line 174
        if (twig_length_filter($this->env, twig_get_attribute($this->env, $this->source, ($context["loops"] ?? null), "pagination", [], "any", false, false, false, 174))) {
            // line 175
            echo "\t\t\t\t";
            $location = "pagination.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("pagination.html", "mcp_topic.html", 175)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
            // line 176
            echo "\t\t\t";
        } else {
            // line 177
            echo "\t\t\t\t &bull; ";
            echo ($context["PAGE_NUMBER"] ?? null);
            echo "
\t\t\t";
        }
        // line 179
        echo "\t\t</div>
\t</div>

\t</div>
</div>

<fieldset class=\"display-actions\">
\t<select name=\"action\">
\t\t<option value=\"\" selected=\"selected\">";
        // line 187
        echo $this->extensions['phpbb\template\twig\extension']->lang("SELECT_ACTION");
        echo "</option>
\t\t";
        // line 188
        if (($context["S_CAN_APPROVE"] ?? null)) {
            echo "<option value=\"approve\">";
            echo $this->extensions['phpbb\template\twig\extension']->lang("APPROVE_POSTS");
            echo "</option>";
        }
        // line 189
        echo "\t\t";
        if (($context["S_CAN_LOCK"] ?? null)) {
            echo "<option value=\"lock_post\">";
            echo $this->extensions['phpbb\template\twig\extension']->lang("LOCK_POST_POSTS");
            echo " [ ";
            echo $this->extensions['phpbb\template\twig\extension']->lang("LOCK_POST_EXPLAIN");
            echo " ]</option><option value=\"unlock_post\">";
            echo $this->extensions['phpbb\template\twig\extension']->lang("UNLOCK_POST_POSTS");
            echo "</option>";
        }
        // line 190
        echo "\t\t";
        if (($context["S_CAN_DELETE"] ?? null)) {
            echo "<option value=\"delete_post\">";
            echo $this->extensions['phpbb\template\twig\extension']->lang("DELETE_POSTS");
            echo "</option>";
        }
        // line 191
        echo "\t\t";
        if (($context["S_CAN_RESTORE"] ?? null)) {
            echo "<option value=\"restore\">";
            echo $this->extensions['phpbb\template\twig\extension']->lang("RESTORE_POSTS");
            echo "</option>";
        }
        // line 192
        echo "\t\t";
        if (($context["S_CAN_MERGE"] ?? null)) {
            echo "<option value=\"merge_posts\"";
            if (($context["S_MERGE_VIEW"] ?? null)) {
                echo " selected=\"selected\"";
            }
            echo ">";
            echo $this->extensions['phpbb\template\twig\extension']->lang("MERGE_POSTS");
            echo "</option>";
        }
        // line 193
        echo "\t\t";
        if (($context["S_CAN_SPLIT"] ?? null)) {
            echo "<option value=\"split_all\"";
            if (($context["S_SPLIT_VIEW"] ?? null)) {
                echo " selected=\"selected\"";
            }
            echo ">";
            echo $this->extensions['phpbb\template\twig\extension']->lang("SPLIT_POSTS");
            echo "</option><option value=\"split_beyond\">";
            echo $this->extensions['phpbb\template\twig\extension']->lang("SPLIT_AFTER");
            echo "</option>";
        }
        // line 194
        echo "\t\t";
        if (($context["S_CAN_SYNC"] ?? null)) {
            echo "<option value=\"resync\">";
            echo $this->extensions['phpbb\template\twig\extension']->lang("RESYNC");
            echo "</option>";
        }
        // line 195
        echo "\t</select>&nbsp;
\t<input class=\"button1\" type=\"submit\" name=\"mcp_topic_submit\" value=\"";
        // line 196
        echo $this->extensions['phpbb\template\twig\extension']->lang("SUBMIT");
        echo "\" />
\t<div><a href=\"#\" onclick=\"marklist('mcp', 'post', true); return false;\">";
        // line 197
        echo $this->extensions['phpbb\template\twig\extension']->lang("MARK_ALL");
        echo "</a> :: <a href=\"#\" onclick=\"marklist('mcp', 'post', false); return false;\">";
        echo $this->extensions['phpbb\template\twig\extension']->lang("UNMARK_ALL");
        echo "</a></div>
";
        // line 198
        echo ($context["S_HIDDEN_FIELDS"] ?? null);
        echo "
";
        // line 199
        echo ($context["S_FORM_TOKEN"] ?? null);
        echo "
</fieldset>

</form>

";
        // line 204
        $location = "mcp_footer.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("mcp_footer.html", "mcp_topic.html", 204)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
    }

    public function getTemplateName()
    {
        return "mcp_topic.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  676 => 204,  668 => 199,  664 => 198,  658 => 197,  654 => 196,  651 => 195,  644 => 194,  631 => 193,  620 => 192,  613 => 191,  606 => 190,  595 => 189,  589 => 188,  585 => 187,  575 => 179,  569 => 177,  566 => 176,  553 => 175,  551 => 174,  547 => 173,  539 => 167,  530 => 165,  520 => 159,  519 => 158,  516 => 157,  512 => 155,  503 => 153,  499 => 152,  495 => 151,  492 => 150,  490 => 149,  487 => 148,  486 => 147,  479 => 145,  476 => 144,  468 => 141,  465 => 140,  463 => 139,  460 => 138,  452 => 135,  449 => 134,  447 => 133,  444 => 132,  436 => 129,  433 => 128,  431 => 127,  428 => 126,  427 => 125,  424 => 124,  407 => 123,  403 => 122,  397 => 121,  394 => 120,  393 => 119,  390 => 118,  389 => 117,  382 => 116,  381 => 115,  367 => 110,  360 => 109,  353 => 105,  347 => 104,  341 => 101,  330 => 98,  328 => 97,  323 => 96,  318 => 93,  313 => 92,  301 => 91,  291 => 83,  286 => 80,  280 => 79,  273 => 77,  269 => 76,  263 => 74,  258 => 72,  255 => 71,  253 => 70,  250 => 69,  243 => 65,  238 => 64,  235 => 63,  234 => 62,  227 => 60,  222 => 59,  219 => 58,  218 => 57,  215 => 56,  188 => 53,  184 => 52,  179 => 51,  176 => 50,  174 => 49,  169 => 47,  166 => 46,  164 => 45,  149 => 41,  144 => 40,  138 => 37,  131 => 36,  121 => 29,  112 => 23,  106 => 22,  101 => 20,  95 => 17,  89 => 16,  84 => 14,  81 => 13,  76 => 11,  71 => 9,  69 => 8,  65 => 7,  63 => 6,  53 => 4,  49 => 2,  37 => 1,);
    }

    public function getSourceContext()
    {
        return new Source("", "mcp_topic.html", "");
    }
}

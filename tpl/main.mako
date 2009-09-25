<%! from time import time %>
<%inherit file="base.mako"/>
<%page cached="False"/>

<div class="grid_12">
<h1 id=branding><i>Trackon <b><small>Pre-Alpha 2</small></b></i></h1>
</div>


<div class="clear"></div>
<div class="grid_12">
    <ul class="nav main">
        <li></li>
    </ul>
</div>

<p class=grid_12>Stil experimental, <b>please do not post to torrent freak or any public
forum yet! ;)</b></p>

% if trackers:
<table cellspacing=0 class='sortable grid_12'>
    <thead><tr>
        <th>Tracker</th>
        <th>Latency</th>
        <th>Checked</th>
        <th>Up?</th>
        <th>Interval</th>
        <th>Announce</th>
        <th>...</th>
    </tr></thead>
    % for a in trackers:
        <% t = trackers[a] %>
        % if not t:
            <% continue %>
        % endif
        <tr>
            <td>${t['name']}</td>
            <td>${"%.3f" % t['latency']}</td>
            <td>${(int(time()) - t['updated']) / 60}m ago</td>
            <td><a href="${t['announce_url']}" title="">Link</a></td>

        % if 'error' in t:
            <b title="${t['error']}">Error!</b>
            <td></td> <td></td> <td></td>
        % else:
            <% r = t['response'] %>
            <td><b>UP!</b></td>
            <td>${r['interval']}</td>
            ##cell("%d/%d/%d %d:%d:%d"%(gmtime(s['updated'])[:6]))
            <td>${repr(r)}</td>
        % endif

        </tr>
    % endfor
% endif

</table>


<form method="POST" class=grid_12>

    <fieldset class="login">
        <input type="text" name="tracker-address" value="" size=64>
        <input type="submit" value="Add Tracker">
    </fieldset>
</form>

<div class=grid_12>

<p>If you post a new tracker, please allow for a few minutes while we gather
statistics before it is added to the list.</p>

<p><a href='http://uriel.cat-v.org/contact'>Contact for comments and bug
reports</a>.</p>
</div>


<div class=grid_12>
<img src='http://upload.wikimedia.org/wikipedia/commons/3/3e/Nine-Dragons1.jpg' title='The Trackon' alt='The Trackon' />
</div>

# Table of conditions

[Go back](..)

<table class="table table-bordered table-striped">
<thead>
    <tr>
        <th>NZCV bits</th>
        <th>Operator</th>
        <th>NZCV</th>
        <th>Detail</th>
    </tr>
</thead>
<tbody>
    <tr>
        <td></td>
        <td>al</td>
        <td></td>
        <td>Always</td>
    </tr>
    <tr>
        <td>0000</td>
        <td>eq</td>
        <td>Z</td>
        <td>Last result is 0</td>
    </tr>
    <tr>
        <td>0001</td>
        <td>ne</td>
        <td>!Z</td>
        <td>Last result isn't 0</td>
    </tr>
    <tr>
        <td>0100</td>
        <td>mi</td>
        <td>N</td>
        <td>Last result is negative</td>
    </tr>
    <tr>
        <td>0101</td>
        <td>pl</td>
        <td>!N</td>
        <td>Last result is positive</td>
    </tr>
    <tr>
        <td>1010</td>
        <td>ge</td>
        <td>N==V</td>
        <td>Greater or equals</td>
    </tr>
    <tr>
        <td>1011</td>
        <td>lt</td>
        <td>N !=V</td>
        <td>Less than</td>
    </tr>
    <tr>
        <td>1100</td>
        <td>gt</td>
        <td>!Z AND (N==V)</td>
        <td>Greater than</td>
    </tr>
    <tr>
        <td>1101</td>
        <td>le</td>
        <td>Z or (N != V)</td>
        <td>Less or equals</td>
    </tr>
    <tr>
        <td></td>
        <td>CS, CC</td>
        <td>C, !C</td>
        <td>With/Without carry</td>
    </tr>
    <tr>
        <td></td>
        <td>VS, VC</td>
        <td>V, !V</td>
        <td>With/Without overflow</td>
    </tr>
</tbody>

</table>
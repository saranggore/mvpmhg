<aura:application extends="force:slds">
   
    <lightning:card title="Lead" iconName="standard:lead">
        <aura:set attribute="actions">
        <lightning:button label="Follow"/>
    <lightning:buttonGroup >
        <lightning:button label="New Case"/>
        <lightning:button label="New Note"/>
        <lightning:button label="Submit for Approval"/>
        <lightning:buttonMenu alternativeText="Show Menu">
            <lightning:menuItem label="Menu1"/>
            <lightning:menuItem label="Menu2"/>
            <lightning:menuItem label="Menu3"/>
        </lightning:buttonMenu>
        </lightning:buttonGroup>
            </aura:set>
        Title<br/>Director Iqra<br/>
        Company<br/>Florida
    </lightning:card>
</aura:application>
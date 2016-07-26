$guid = [Guid]::NewGuid().ToString().Replace("-","")

Describe "Add-Type" {
    It "Should not throw given a simple class definition" {
        { Add-Type -TypeDefinition "public static class foo { }" } | Should Not Throw
    }

    It "Can use System.Management.Automation.CmdletAttribute" {
        $code = @"
[System.Management.Automation.Cmdlet("Get", "Thing", ConfirmImpact = System.Management.Automation.ConfirmImpact.High, SupportsPaging = true)]
public class AttributeTest$guid {}
"@
        Add-Type -TypeDefinition $code -PassThru | Should Not Be $null
    }
}

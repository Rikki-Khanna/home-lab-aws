package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"github.com/tidwall/gjson"
)

func TestWafDefault(t *testing.T) {

	terraformOptions := &terraform.Options{

		// The path to where our Terraform code is located
		TerraformDir: "./default",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{},

		// Configure a plan file path so we can introspect the plan and make assertions about it.
		PlanFilePath: "plan.out",

		// Disable colors in Terraform commands so its easier to parse stdout/stderr
		NoColor: true,
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	jsonOut := terraform.InitAndPlanAndShow(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	output := gjson.Get(jsonOut, `planned_values.root_module.child_modules.0.resources.0.values.bucket`).String()

	// Verify we're getting expected tags in output
	assert.Equal(t, "home-lab-test",  output)
}

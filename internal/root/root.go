// SPDX-License-Identifier: AGPL-3.0-or-later

package root

import (
	"github.com/h0m3-lab/h3ctl/commands/cache"
	"github.com/h0m3-lab/h3ctl/commands/cluster"
	configcmd "github.com/h0m3-lab/h3ctl/commands/config"
	"github.com/h0m3-lab/h3ctl/commands/global"
	"github.com/h0m3-lab/h3ctl/commands/svc"
	"github.com/h0m3-lab/h3ctl/commands/talos"
	vmcmd "github.com/h0m3-lab/h3ctl/commands/vm"
	"github.com/spf13/cobra"
)

// Build constructs and returns the h3ctl root command.
// Used by main.go and tools/docgen.
func Build() *cobra.Command {
	var clusterFlag, vmFlag, outputFlag string

	root := &cobra.Command{
		Use:          "h3ctl",
		Short:        "h3ctl — local Talos cluster manager",
		Long:         "Dummy-friendly cluster workflows built from the same VM and Talos primitives exposed to power users.",
		SilenceUsage: true,
	}

	root.PersistentFlags().StringVar(&clusterFlag, "cluster", "", "target cluster (overrides active context)")
	root.PersistentFlags().StringVar(&vmFlag, "vm", "", "target VM (used with vm/config/talos/svc commands)")
	root.PersistentFlags().StringVar(&outputFlag, "output", "text", "output format: text|json")

	root.AddCommand(
		cluster.NewCmd(&clusterFlag, &outputFlag),
		configcmd.NewCmd(&clusterFlag, &vmFlag, &outputFlag),
		vmcmd.NewCmd(&clusterFlag, &vmFlag, &outputFlag),
		talos.NewCmd(&clusterFlag, &vmFlag, &outputFlag),
		svc.NewCmd(&clusterFlag, &vmFlag, &outputFlag),
		cache.NewCmd(&outputFlag),
		global.NewInitCmd(),
		global.NewDestroyCmd(),
		global.NewListCmd(),
		global.NewActiveCmd(),
		global.NewUseCmd(),
		global.NewUnuseCmd(),
	)

	return root
}

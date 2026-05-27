// SPDX-License-Identifier: AGPL-3.0-or-later

package cluster

import (
	"errors"

	"github.com/spf13/cobra"
)

func newKubeconfigCmd(cluster *string, output *string) *cobra.Command {
	var outPath string
	cmd := &cobra.Command{
		Use:   "kubeconfig",
		Short: "Fetch kubeconfig from a bootstrapped cluster",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
	cmd.Flags().StringVar(&outPath, "out", "", "write kubeconfig to this path instead of ~/.kube/config")
	return cmd
}

// SPDX-License-Identifier: AGPL-3.0-or-later

package cluster

import (
	"errors"

	"github.com/spf13/cobra"
)

func newCreateCmd(cluster *string, output *string) *cobra.Command {
	var setFlags []string
	cmd := &cobra.Command{
		Use:   "create",
		Short: "Create a new cluster directory and h3.yaml with defaults",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
	cmd.Flags().StringArrayVar(&setFlags, "set", nil, "set config field at creation (key=value), repeatable")
	return cmd
}

// Code generated by applyconfiguration-gen. DO NOT EDIT.

package v1

import (
	v1 "github.com/openshift/api/config/v1"
)

// ComponentRouteSpecApplyConfiguration represents a declarative configuration of the ComponentRouteSpec type for use
// with apply.
type ComponentRouteSpecApplyConfiguration struct {
	Namespace                *string                                `json:"namespace,omitempty"`
	Name                     *string                                `json:"name,omitempty"`
	Hostname                 *v1.Hostname                           `json:"hostname,omitempty"`
	ServingCertKeyPairSecret *SecretNameReferenceApplyConfiguration `json:"servingCertKeyPairSecret,omitempty"`
}

// ComponentRouteSpecApplyConfiguration constructs a declarative configuration of the ComponentRouteSpec type for use with
// apply.
func ComponentRouteSpec() *ComponentRouteSpecApplyConfiguration {
	return &ComponentRouteSpecApplyConfiguration{}
}

// WithNamespace sets the Namespace field in the declarative configuration to the given value
// and returns the receiver, so that objects can be built by chaining "With" function invocations.
// If called multiple times, the Namespace field is set to the value of the last call.
func (b *ComponentRouteSpecApplyConfiguration) WithNamespace(value string) *ComponentRouteSpecApplyConfiguration {
	b.Namespace = &value
	return b
}

// WithName sets the Name field in the declarative configuration to the given value
// and returns the receiver, so that objects can be built by chaining "With" function invocations.
// If called multiple times, the Name field is set to the value of the last call.
func (b *ComponentRouteSpecApplyConfiguration) WithName(value string) *ComponentRouteSpecApplyConfiguration {
	b.Name = &value
	return b
}

// WithHostname sets the Hostname field in the declarative configuration to the given value
// and returns the receiver, so that objects can be built by chaining "With" function invocations.
// If called multiple times, the Hostname field is set to the value of the last call.
func (b *ComponentRouteSpecApplyConfiguration) WithHostname(value v1.Hostname) *ComponentRouteSpecApplyConfiguration {
	b.Hostname = &value
	return b
}

// WithServingCertKeyPairSecret sets the ServingCertKeyPairSecret field in the declarative configuration to the given value
// and returns the receiver, so that objects can be built by chaining "With" function invocations.
// If called multiple times, the ServingCertKeyPairSecret field is set to the value of the last call.
func (b *ComponentRouteSpecApplyConfiguration) WithServingCertKeyPairSecret(value *SecretNameReferenceApplyConfiguration) *ComponentRouteSpecApplyConfiguration {
	b.ServingCertKeyPairSecret = value
	return b
}

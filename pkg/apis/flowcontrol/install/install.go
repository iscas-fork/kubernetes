/*
Copyright 2015 The Kubernetes Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

// Package install installs the experimental API group, making it available as
// an option to all of the API encoding/decoding machinery.
package install

import (
	"k8s.io/apimachinery/pkg/runtime"
	utilruntime "k8s.io/apimachinery/pkg/util/runtime"
	"k8s.io/kubernetes/pkg/api/legacyscheme"
	"k8s.io/kubernetes/pkg/apis/flowcontrol"
	flowcontrolv1 "k8s.io/kubernetes/pkg/apis/flowcontrol/v1"
)

func init() {
	Install(legacyscheme.Scheme)
}

// Install registers the API group and adds types to a scheme
func Install(scheme *runtime.Scheme) {
	utilruntime.Must(flowcontrol.AddToScheme(scheme))
	utilruntime.Must(flowcontrolv1.AddToScheme(scheme))

	// TODO(#121119): This controls serialization order, for 1.29, we continue
	//  to use v1beta3 as the serialization version because vN-1 understands that
	//  level. In 1.30, we should set the serialization version to v1.
	utilruntime.Must(scheme.SetVersionPriority(flowcontrolv1.SchemeGroupVersion))
}
